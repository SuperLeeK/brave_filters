import sys

# 명령줄 인자 처리
if len(sys.argv) < 2:
    print("사용법: python generate_filter.py <번호>")
    print("예시: python generate_filter.py 468")
    sys.exit(1)

# 인자에서 번호 가져오기
booktoki_no = sys.argv[1]
site_url = f"booktoki{booktoki_no}.com"

# 템플릿 파일 읽기
with open('site/booktoki.template', 'r') as f:
    template = f.read()

# 플레이스홀더 교체
final_content = template.replace('SITE_URL', site_url)

# 결과 파일 쓰기
with open('site/booktoki', 'w') as f:
    f.write(final_content)

print(f"필터 규칙이 생성되었습니다. 사이트 URL: {site_url}")