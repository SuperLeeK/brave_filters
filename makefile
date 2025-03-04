.PHONY: filter clean help

# 기본 대상 (make만 입력했을 때 실행됨)
all: help

# 필터 생성 (인자 사용)
filter:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "사용법: make filter <번호>"; \
		echo "예시: make filter 468"; \
		exit 1; \
	else \
		echo "필터 규칙 생성 중..."; \
		python3.10 scripts/generate_filter.py $(filter-out $@,$(MAKECMDGOALS)); \
		echo "완료!"; \
	fi

# 인자 무시 (468과 같은 숫자 인자를 대상으로 인식하지 않게 함)
%:
	@:

# 생성된 파일 삭제
clean:
	@echo "생성된 필터 파일 삭제 중..."
	@rm -f site/booktoki
	@echo "삭제 완료!"

# 도움말
help:
	@echo "사용 가능한 명령어:"
	@echo "  make filter <번호>  - 지정된 번호로 필터 규칙 생성"
	@echo "                       예시: make filter 468"
	@echo "  make clean          - 생성된 파일 삭제"
	@echo "  make help           - 이 도움말 표시"