Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E25155299E
	for <meta-arago@arago-project.org>;
	Mon, 24 Jun 2019 12:53:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OCr0in013680
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 07:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561380780;
	bh=jzEkG8asCiZ7rHPCRansYA3DLhi2Mrzql+2MzqqpTvc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=D9GRM/n/+deItW4gU8O6Pyhgs5OcMstNWH1xVZMRuR4tAeIZKrL56xTm9gOUxX51L
	LOHkKatXsofdvkbln7sOb0HZjW2du3v5AahcWzhtJsArwJhQv5Pz0bjJ1xxyLUA47y
	nFOkC48r6YoPHWBIyC+Nk/Dv2dmjOCxuYF60CsSw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OCr0gR042191
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 07:53:00 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 24 Jun 2019 07:52:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 24 Jun 2019 07:52:59 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OCqxk8045721;
	Mon, 24 Jun 2019 07:52:59 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20190620182230.96572-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f7058dc3-7199-5e42-9445-1fd0cb5f7dc5@ti.com>
Date: Mon, 24 Jun 2019 08:52:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190620182230.96572-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/ti2019.01][PATCH] tidl-api: fix g++ 8.3.0 compilation error
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jun 2019 12:53:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake

On 6/20/2019 2:22 PM, Yuan Zhao wrote:
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   .../0002-tidl-api_gcc_8.3.0_compilation.patch      | 52 ++++++++++++++++++++++
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc |  3 +-
>   .../recipes-ti/tidl-api/tidl-api_git.bb            |  2 +-
>   3 files changed, 55 insertions(+), 2 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
> new file mode 100644
> index 00000000..6a48203e
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
> @@ -0,0 +1,52 @@
> +commit aa7101256aefcea11d326740c111bf37a48b191e (HEAD -> master_patch)
> +Author: Yuan Zhao <yuanzhao@ti.com>
> +Date:   Thu Jun 20 12:01:24 2019 -0500
> +
> +    Fix g++ 8.3.0 compilation error
> +
> +    - Fix a syntax allowed in g++ 7.2.1 but not in 8.3.0
> +    - Make should report error from loop
> +
> +    Upstream-Status: Submitted [Remove this patch when next release is out]
> +
> +    Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> +
> +diff --git a/examples/Makefile b/examples/Makefile
> +index 52b3ff6..9217380 100644
> +--- a/examples/Makefile
> ++++ b/examples/Makefile
> +@@ -34,7 +34,7 @@ RUN_DIRS := $(filter-out classification, $(DIRS))
> + define make_in_dirs
> + 	@for dir in $(1); do \
> + 	  echo "=============== " $$dir " =================" ; \
> +-	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2); \
> ++	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2) || exit 1; \
> + 	done
> + endef
> +
> +diff --git a/examples/classification/main.cpp b/examples/classification/main.cpp
> +index 020004b..25361f8 100644
> +--- a/examples/classification/main.cpp
> ++++ b/examples/classification/main.cpp
> +@@ -699,7 +699,7 @@ int tf_postprocess(uchar *in, int size, int roi_idx, int frame_idx, int f_id)
> +   int rpt_id = -1;
> +
> +   typedef std::pair<uchar, int> val_index;
> +-  auto constexpr cmp = [](val_index &left, val_index &right) { return left.first > right.first; };
> ++  auto cmp = [](val_index &left, val_index &right) { return left.first > right.first; };
> +   std::priority_queue<val_index, std::vector<val_index>, decltype(cmp)> queue(cmp);
> +   // initialize priority queue with smallest value on top
> +   for (int i = 0; i < k; i++) {
> +diff --git a/examples/imagenet/main.cpp b/examples/imagenet/main.cpp
> +index 937f467..dc1035b 100644
> +--- a/examples/imagenet/main.cpp
> ++++ b/examples/imagenet/main.cpp
> +@@ -309,7 +309,7 @@ bool WriteFrameOutput(const ExecutionObjectPipeline &eop,
> +
> +     // sort and get k largest values and corresponding indices
> +     typedef pair<unsigned char, int> val_index;
> +-    auto constexpr cmp = [](val_index &left, val_index &right)
> ++    auto cmp = [](val_index &left, val_index &right)
> +                          { return left.first > right.first; };
> +     priority_queue<val_index, vector<val_index>, decltype(cmp)> queue(cmp);
> +     // initialize priority queue with smallest value on top
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index 04049e73..d93aec82 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,5 +1,5 @@
>   PV = "1.3.0"
> -INC_PR = "r1"
> +INC_PR = "r2"
>   
>   LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
>   
> @@ -12,4 +12,5 @@ SRCREV = "785170685ca6a5c11876b05ddf74741c419393be"
>   
>   # default patchdir is ${S}
>   SRC_URI += "file://0001-tidl-api_l2_cache_size.patch"
> +SRC_URI += "file://0002-tidl-api_gcc_8.3.0_compilation.patch"
>   S = "${WORKDIR}/git"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> index 1deb59e3..48f4db1d 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -8,7 +8,7 @@ require recipes-ti/includes/ti-paths.inc
>   
>   PR = "${INC_PR}.0"
>   
> -COMPATIBLE_MACHINE = "dra7xx-evm|m57xx-evm|am57xx-hs-evm"
> +COMPATIBLE_MACHINE = "dra7xx-evm|am57xx-evm|am57xx-hs-evm"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   inherit python3native

