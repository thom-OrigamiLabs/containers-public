#!/usr/bin/env bash

# Based heavily on NVIDIA's docker_build_ml.sh

set -e

source scripts/docker_base.sh
source scripts/opencv_version.sh
source scripts/python_version.sh

CONTAINERS=${1:-"all"}

#
# PyTorch 
#
build_origami()
{
	local pytorch_url=$1
	local pytorch_whl=$2
	local pytorch_tag=$3
	
	local vision_version=$4
	local audio_version=$5
	local cuda_arch_list=${6:-"5.3;6.2;7.2"}
	
	echo "building PyTorch $pytorch_whl, torchvision $vision_version, torchaudio $audio_version, cuda arch $cuda_arch_list"

	sh ./scripts/docker_build.sh $pytorch_tag Dockerfile.origami \
			--build-arg BASE_IMAGE=$BASE_IMAGE \
			--build-arg PYTORCH_URL=$pytorch_url \
			--build-arg PYTORCH_WHL=$pytorch_whl \
			--build-arg TORCHVISION_VERSION=$vision_version \
			--build-arg TORCHAUDIO_VERSION=$audio_version \
			--build-arg TORCH_CUDA_ARCH_LIST=$cuda_arch_list \
			--build-arg OPENCV_URL=$OPENCV_URL \
			--build-arg OPENCV_DEB=$OPENCV_DEB 

	echo "done building PyTorch $pytorch_whl, torchvision $vision_version, torchaudio $audio_version, cuda arch $cuda_arch_list"
}

if [[ "$CONTAINERS" == "origami" || "$CONTAINERS" == "origami_slim" ]]; then

	if [[ $L4T_RELEASE -eq 32 ]]; then   # JetPack 4.x

		# PyTorch v1.2.0
		#build_origami "https://nvidia.box.com/shared/static/lufbgr3xu2uha40cs9ryq1zn4kxsnogl.whl" \
		#			  "torch-1.2.0-cp36-cp36m-linux_aarch64.whl" \
		#			  "l4t-pytorch:r$L4T_VERSION-pth1.2-py3" \
		#			  "v0.4.0"

		# PyTorch v1.3.0
		#build_origami "https://nvidia.box.com/shared/static/017sci9z4a0xhtwrb4ps52frdfti9iw0.whl" \
		#			  "torch-1.3.0-cp36-cp36m-linux_aarch64.whl" \
		#			  "l4t-pytorch:r$L4T_VERSION-pth1.3-py3" \
		#			  "v0.4.2"

		# PyTorch v1.4.0
		#build_origami "https://nvidia.box.com/shared/static/c3d7vm4gcs9m728j6o5vjay2jdedqb55.whl" \
		#			  "torch-1.4.0-cp36-cp36m-linux_aarch64.whl" \
		#			  "l4t-pytorch:r$L4T_VERSION-pth1.4-py3" \
		#			  "v0.5.0"

		# PyTorch v1.5.0
		#build_origami "https://nvidia.box.com/shared/static/3ibazbiwtkl181n95n9em3wtrca7tdzp.whl" \
		#			  "torch-1.5.0-cp36-cp36m-linux_aarch64.whl" \
		#			  "l4t-pytorch:r$L4T_VERSION-pth1.5-py3" \
		#			  "v0.6.0"

		# PyTorch v1.6.0
		#build_origami "https://nvidia.box.com/shared/static/9eptse6jyly1ggt9axbja2yrmj6pbarc.whl" \
		#			  "torch-1.6.0-cp36-cp36m-linux_aarch64.whl" \
		#			  "l4t-pytorch:r$L4T_VERSION-pth1.6-py3" \
		#			  "v0.7.0" \
		#			  "v0.6.0"
					  
		# PyTorch v1.7.0
		#build_origami "https://nvidia.box.com/shared/static/cs3xn3td6sfgtene6jdvsxlr366m2dhq.whl" \
		#			  "torch-1.7.0-cp36-cp36m-linux_aarch64.whl" \
		#			  "l4t-pytorch:r$L4T_VERSION-pth1.7-py3" \
		#			  "v0.8.1" \
		#			  "v0.7.0"
		
		# PyTorch v1.8.0
		#build_origami "https://nvidia.box.com/shared/static/p57jwntv436lfrd78inwl7iml6p13fzh.whl" \
		#			"torch-1.8.0-cp36-cp36m-linux_aarch64.whl" \
		#			"l4t-pytorch:r$L4T_VERSION-pth1.8-py3" \
		#			"v0.9.0" \
		#			"v0.8.0"
			
		# PyTorch v1.9.0
		build_origami "https://nvidia.box.com/shared/static/h1z9sw4bb1ybi0rm3tu8qdj8hs05ljbm.whl" \
					"torch-1.9.0-cp36-cp36m-linux_aarch64.whl" \
					"l4t-pytorch:r$L4T_VERSION-pth1.9-py3" \
					"v0.10.0" \
					"v0.9.0"
					
		# PyTorch v1.10.0
		build_origami "https://nvidia.box.com/shared/static/fjtbno0vpo676a25cgvuqc1wty0fkkg6.whl" \
					"torch-1.10.0-cp36-cp36m-linux_aarch64.whl" \
					"l4t-pytorch:r$L4T_VERSION-pth1.10-py3" \
					"v0.11.1" \
					"v0.10.0"
					
		# PyTorch v1.11.0
		build_origami "https://developer.download.nvidia.com/compute/redist/jp/v461/pytorch/torch-1.11.0a0+17540c5-cp36-cp36m-linux_aarch64.whl" \
					"torch-1.11.0a0+17540c5-cp36-cp36m-linux_aarch64.whl" \
					"l4t-pytorch:r$L4T_VERSION-pth1.11-py3" \
					"v0.11.3" \
					"v0.10.2"
					
	elif [[ $L4T_RELEASE -eq 34 ]]; then   # JetPack 5.0.0 (DP) / 5.0.1 (DP2)
	
		jp5_cuda_arch="7.2;8.7"
		
		# PyTorch v1.10.0
		#build_origami "https://nvidia.box.com/shared/static/19je2l0ppy1fpq4mw1a5gsbb5y9fopy7.whl" \
		#			"torch-1.10.0-cp38-cp38-linux_aarch64.whl" \
		#			"l4t-pytorch:r$L4T_VERSION-pth1.10-py3" \
		#			"v0.11.1" \
		#			"v0.10.0" \
		#			$jp5_cuda_arch
		
		# PyTorch v1.11.0
		build_origami "https://nvidia.box.com/shared/static/ssf2v7pf5i245fk4i0q926hy4imzs2ph.whl" \
					"torch-1.11.0-cp38-cp38-linux_aarch64.whl" \
					"l4t-origami:r$L4T_VERSION-pth1.11-py3" \
					"v0.12.0" \
					"v0.11.0" \
					$jp5_cuda_arch
					
		# PyTorch v1.12.0
		build_origami "https://developer.download.nvidia.com/compute/redist/jp/v50/pytorch/torch-1.12.0a0+2c916ef.nv22.3-cp38-cp38-linux_aarch64.whl" \
					"torch-1.12.0a0+2c916ef.nv22.3-cp38-cp38-linux_aarch64.whl" \
					"l4t-origami:r$L4T_VERSION-pth1.12-py3" \
					"v0.12.0" \
					"v0.11.0" \
					$jp5_cuda_arch
					
	elif [[ $L4T_RELEASE -eq 35 ]]; then   # JetPack 5.0.2 (GA)
	
		jp5_cuda_arch="7.2;8.7"
		
		# PyTorch v1.11.0
		build_origami "https://nvidia.box.com/shared/static/ssf2v7pf5i245fk4i0q926hy4imzs2ph.whl" \
					"torch-1.11.0-cp38-cp38-linux_aarch64.whl" \
					"l4t-origami:r$L4T_VERSION-pth1.11-py3" \
					"v0.12.0" \
					"v0.11.0" \
					$jp5_cuda_arch
					
		# PyTorch v1.12.0
		build_origami "https://developer.download.nvidia.com/compute/redist/jp/v50/pytorch/torch-1.12.0a0+8a1a93a9.nv22.5-cp38-cp38-linux_aarch64.whl" \
					"torch-1.12.0a0+8a1a93a9.nv22.5-cp38-cp38-linux_aarch64.whl" \
					"l4t-origami:r$L4T_VERSION-pth1.12-py3" \
					"v0.13.0" \
					"v0.12.0" \
					$jp5_cuda_arch
					
		# PyTorch v1.13.0
		build_origami "https://developer.download.nvidia.com/compute/redist/jp/v50/pytorch/torch-1.13.0a0+340c4120.nv22.06-cp38-cp38-linux_aarch64.whl" \
					"torch-1.13.0a0+340c4120.nv22.06-cp38-cp38-linux_aarch64.whl" \
					"l4t-origami:r$L4T_VERSION-pth1.13-py3" \
					"v0.13.0" \
					"v0.12.0" \
					$jp5_cuda_arch
	else
		echo "warning -- unsupported L4T R$L4T_VERSION, skipping PyTorch..."
	fi
fi

