#!/usr/bin/env nextflow
// hash:sha256:0585bc1421e1b8a641cac81981069265b8bf822b02a9763632ff71dd01c114b0

// capsule - MOSuite - create multiOmicDataSet
process capsule_mosuite_create_multiomicdataset_4 {
	tag 'capsule-6541445'
	container "$REGISTRY_HOST/published/5ce5f88d-980d-4e61-b3a4-ef4a0ce48030:v5"

	cpus 1
	memory '7.5 GB'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_clean_raw_counts_8_3

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=5ce5f88d-980d-4e61-b3a4-ef4a0ce48030
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/nidap-1.0" "capsule/data/nidap-1.0" # id: bd9a7518-66cb-4d50-9992-df3271aeb807

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v5.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6541445.git" capsule-repo
	else
		git clone --branch v5.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6541445.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_create_multiomicdataset_4_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - clean raw counts
process capsule_mosuite_clean_raw_counts_8 {
	tag 'capsule-5801113'
	container "$REGISTRY_HOST/published/ab07963e-d9e0-489e-b776-70f6ef2ef73b:v3"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_filter_low_counts_6_1

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=ab07963e-d9e0-489e-b776-70f6ef2ef73b
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v3.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5801113.git" capsule-repo
	else
		git clone --branch v3.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5801113.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_clean_raw_counts_8_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - filter low counts
process capsule_mosuite_filter_low_counts_6 {
	tag 'capsule-4565215'
	container "$REGISTRY_HOST/published/0296f612-3498-4ed0-ac13-50620e45d67d:v1"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_normalize_counts_7_2
	path 'capsule/results/*', emit: to_capsule_mosuite_differential_expression_analysis_10_5

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=0296f612-3498-4ed0-ac13-50620e45d67d
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-4565215.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-4565215.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_filter_low_counts_6_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - differential expression analysis
process capsule_mosuite_differential_expression_analysis_10 {
	tag 'capsule-6218465'
	container "$REGISTRY_HOST/published/03afd79c-bd16-4767-ade0-794d2d6c88bc:v1"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_filter_differential_expression_results_11_6

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=03afd79c-bd16-4767-ade0-794d2d6c88bc
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6218465.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6218465.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_differential_expression_analysis_10_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - normalize counts
process capsule_mosuite_normalize_counts_7 {
	tag 'capsule-9169525'
	container "$REGISTRY_HOST/published/75561d95-aa78-4140-b64d-ddae5b64fc39:v1"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*', emit: to_capsule_mosuite_batch_correct_counts_9_4
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_expression_heatmap_12_7
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_2_d_pca_13_8
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_3_d_pca_14_9

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=75561d95-aa78-4140-b64d-ddae5b64fc39
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9169525.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9169525.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_normalize_counts_7_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - batch correct counts
process capsule_mosuite_batch_correct_counts_9 {
	tag 'capsule-1373453'
	container "$REGISTRY_HOST/published/065804a2-efa7-43f2-9692-967bf0d6b592:v1"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=065804a2-efa7-43f2-9692-967bf0d6b592
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-1373453.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-1373453.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_batch_correct_counts_9_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - filter differential expression results
process capsule_mosuite_filter_differential_expression_results_11 {
	tag 'capsule-5215013'
	container "$REGISTRY_HOST/published/7fffbb1b-6366-4787-987d-79decf782bf2:v1"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_volcano_enhanced_15_10
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_volcano_summary_16_11
	path 'capsule/results/*', emit: to_capsule_mosuite_plot_venn_diagram_17_12

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=7fffbb1b-6366-4787-987d-79decf782bf2
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5215013.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5215013.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_filter_differential_expression_results_11_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - plot 2D PCA
process capsule_mosuite_plot_2_d_pca_13 {
	tag 'capsule-8095429'
	container "$REGISTRY_HOST/published/74b4ec28-63bb-4007-a375-053c8d76260d:v1"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=74b4ec28-63bb-4007-a375-053c8d76260d
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8095429.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8095429.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_2_d_pca_13_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - plot 3D PCA
process capsule_mosuite_plot_3_d_pca_14 {
	tag 'capsule-3838154'
	container "$REGISTRY_HOST/capsule/a160b105-3084-46fc-8cc9-02886fd4bacb"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=a160b105-3084-46fc-8cc9-02886fd4bacb
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3838154.git" capsule-repo
	else
		git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3838154.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_3_d_pca_14_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - plot expression heatmap
process capsule_mosuite_plot_expression_heatmap_12 {
	tag 'capsule-0936928'
	container "$REGISTRY_HOST/published/e9bb1415-3976-46d0-b978-2e8e3554ecd2:v1"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=e9bb1415-3976-46d0-b978-2e8e3554ecd2
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0936928.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0936928.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_expression_heatmap_12_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - Plot Venn Diagram
process capsule_mosuite_plot_venn_diagram_17 {
	tag 'capsule-5013652'
	container "$REGISTRY_HOST/published/b18a7c9b-d66b-4921-9df8-0cfa88a4a35a:v1"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=b18a7c9b-d66b-4921-9df8-0cfa88a4a35a
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5013652.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5013652.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_venn_diagram_17_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - Plot Volcano Enhanced
process capsule_mosuite_plot_volcano_enhanced_15 {
	tag 'capsule-7581039'
	container "$REGISTRY_HOST/published/4fbfaf69-b582-4533-8e00-f138caa869d1:v1"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=4fbfaf69-b582-4533-8e00-f138caa869d1
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-7581039.git" capsule-repo
	else
		git clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-7581039.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_volcano_enhanced_15_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - MOSuite - Plot Volcano Summary
process capsule_mosuite_plot_volcano_summary_16 {
	tag 'capsule-6849617'
	container "$REGISTRY_HOST/published/f47f9943-0628-44d3-ae81-b2ed11d73817:v2"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=f47f9943-0628-44d3-ae81-b2ed11d73817
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git clone --filter=tree:0 --branch v2.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6849617.git" capsule-repo
	else
		git clone --branch v2.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6849617.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_mosuite_plot_volcano_summary_16_args}

	echo "[${task.tag}] completed!"
	"""
}

workflow {
	// run processes
	capsule_mosuite_create_multiomicdataset_4()
	capsule_mosuite_clean_raw_counts_8(capsule_mosuite_create_multiomicdataset_4.out.to_capsule_mosuite_clean_raw_counts_8_3.collect())
	capsule_mosuite_filter_low_counts_6(capsule_mosuite_clean_raw_counts_8.out.to_capsule_mosuite_filter_low_counts_6_1.collect())
	capsule_mosuite_differential_expression_analysis_10(capsule_mosuite_filter_low_counts_6.out.to_capsule_mosuite_differential_expression_analysis_10_5.collect())
	capsule_mosuite_normalize_counts_7(capsule_mosuite_filter_low_counts_6.out.to_capsule_mosuite_normalize_counts_7_2.collect())
	capsule_mosuite_batch_correct_counts_9(capsule_mosuite_normalize_counts_7.out.to_capsule_mosuite_batch_correct_counts_9_4)
	capsule_mosuite_filter_differential_expression_results_11(capsule_mosuite_differential_expression_analysis_10.out.to_capsule_mosuite_filter_differential_expression_results_11_6.collect())
	capsule_mosuite_plot_2_d_pca_13(capsule_mosuite_normalize_counts_7.out.to_capsule_mosuite_plot_2_d_pca_13_8.collect())
	capsule_mosuite_plot_3_d_pca_14(capsule_mosuite_normalize_counts_7.out.to_capsule_mosuite_plot_3_d_pca_14_9.collect())
	capsule_mosuite_plot_expression_heatmap_12(capsule_mosuite_normalize_counts_7.out.to_capsule_mosuite_plot_expression_heatmap_12_7.collect())
	capsule_mosuite_plot_venn_diagram_17(capsule_mosuite_filter_differential_expression_results_11.out.to_capsule_mosuite_plot_venn_diagram_17_12.collect())
	capsule_mosuite_plot_volcano_enhanced_15(capsule_mosuite_filter_differential_expression_results_11.out.to_capsule_mosuite_plot_volcano_enhanced_15_10.collect())
	capsule_mosuite_plot_volcano_summary_16(capsule_mosuite_filter_differential_expression_results_11.out.to_capsule_mosuite_plot_volcano_summary_16_11.collect())
}
