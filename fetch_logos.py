import urllib.request
import json
import os

titles = {
    'khu': ('ko', '경희대학교'),
    'snu': ('en', 'Seoul_National_University'),
    'psu': ('en', 'Pennsylvania_State_University'),
    'hyundai': ('en', 'Hyundai_Motor_Company'),
    'naver': ('ko', '네이버'),
    'boseong': ('ko', '보성고등학교_(서울)')
}

os.makedirs('assets', exist_ok=True)

for key, (lang, title) in titles.items():
    url = f"https://{lang}.wikipedia.org/w/api.php?action=query&titles={urllib.parse.quote(title)}&prop=pageimages&format=json&pithumbsize=500"
    try:
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req) as response:
            res = json.loads(response.read())
            pages = res['query']['pages']
            found = False
            for page_id in pages:
                if 'thumbnail' in pages[page_id]:
                    img_url = pages[page_id]['thumbnail']['source']
                    ext = img_url.split('.')[-1].split('?')[0]
                    urllib.request.urlretrieve(img_url, f"assets/{key}.{ext}")
                    print(f"Downloaded {key}.{ext}")
                    found = True
            if not found:
                 print(f"No image for {key}")
    except Exception as e:
        print(f"Error {key}: {e}")
