"""Refresh public article counts from the author's Google Scholar profile."""

import json
import sys
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import parse_qs, urlencode, urlsplit
from urllib.request import Request, urlopen


class ScholarProfile(HTMLParser):
    def __init__(self):
        super().__init__()
        self.counts = {}
        self.article = None
        self.count_text = None

    def handle_starttag(self, tag, attrs):
        attributes = dict(attrs)
        classes = attributes.get('class', '').split()
        if tag == 'tr':
            self.article = None
        if tag != 'a':
            return
        if 'gsc_a_at' in classes:
            query = parse_qs(urlsplit(attributes.get('href', '')).query)
            self.article = query.get('citation_for_view', [None])[0]
        elif self.article and 'gsc_a_ac' in classes:
            self.count_text = []

    def handle_data(self, data):
        if self.count_text is not None:
            self.count_text.append(data)

    def handle_endtag(self, tag):
        if tag == 'a' and self.count_text is not None:
            count = ''.join(self.count_text).strip().replace(',', '')
            if count.isascii() and count.isdecimal():
                self.counts[self.article] = int(count)
            self.count_text = None
        if tag == 'tr':
            self.article = None


def main(output):
    config = json.loads(Path('_data/scholar_citations.json').read_text())
    profiles = {}
    counts = {}
    for paper, citation in config.items():
        article_id = citation['scholar_id']
        user = article_id.split(':', 1)[0]
        if user not in profiles:
            query = urlencode({'user': user, 'hl': 'en', 'pagesize': 100})
            request = Request('https://scholar.google.com/citations?' + query,
                              headers={'User-Agent': 'Mozilla/5.0'})
            profile = ScholarProfile()
            with urlopen(request, timeout=20) as response:
                profile.feed(response.read().decode('utf-8'))
            profiles[user] = profile.counts
        if article_id not in profiles[user]:
            raise SystemExit(f'Google Scholar did not return a verified count for {paper}.')
        counts[paper] = profiles[user][article_id]
    output.write_text(json.dumps(counts, indent=2, sort_keys=True) + '\n')


if __name__ == '__main__':
    main(Path(sys.argv[1]))
