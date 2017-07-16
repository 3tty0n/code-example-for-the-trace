build:
	cat md/01_introduction.md \
	md/02_0_tracing_jit.md \
	md/02_1_tracing_ex.md \
	md/02_2_tracing_jit.md \
	md/03_tracing_the_meta_level.md \
	md/04_evaluation.md \
	md/05_conclution.md \
	md/06_my_future_work.md > md/slide.md

commit: build
	git add .
	git commit -m "update"
	git push
