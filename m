Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E74AD529F3
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2019 16:29:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GSY37071281
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 11:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568046514;
	bh=Mc+0i5h6OPK4ydFcXBQZ2eQXlRb5ETzRaOaOmeB+MBc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=HvL5DmU1it5c0nkGeMwrHmi7DU7O7e5rElIFh00hx8iEhRh9Gr0yewZYRMrfA8zXr
	Gq5KjH8QmocUsJESmhWgq8mqdKrNLZBeOGxVhn7Nl9u0Dr8sPjqM82LPHxAsf8EAWW
	0p22cdy08dBSYxLs+1M37lrIKFAoYk3ANwdEg0no=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89GSYti092861
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 11:28:34 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 9 Sep 2019 11:28:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 9 Sep 2019 11:28:34 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GSYQA099905;
	Mon, 9 Sep 2019 11:28:34 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20190906221650.132984-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <602bfe54-1494-b68b-02eb-7e571b443ce7@ti.com>
Date: Mon, 9 Sep 2019 12:28:34 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906221650.132984-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] tidl-api: update to version 1.3.1
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
X-List-Received-Date: Mon, 09 Sep 2019 16:29:40 -0000
Content-Type: multipart/alternative;
	boundary="------------FD30C98F740EE38CDFC97614"
Content-Language: en-US

--------------FD30C98F740EE38CDFC97614
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Denys,

  Can you backport this to ti2019.03?


Thanks,

  Jake

On 9/6/2019 6:16 PM, Yuan Zhao wrote:
> - Bug fixes
>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   .../files/0001-tidl-api_l2_cache_size.patch        | 41 ---------------
>   .../0002-tidl-api_gcc_8.3.0_compilation.patch      | 59 ----------------------
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc |  8 ++-
>   3 files changed, 3 insertions(+), 105 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
>   delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
> deleted file mode 100644
> index 84e12a18..00000000
> --- a/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -diff --git a/tidl_api/dsp/ocl_wrapper.cl b/tidl_api/dsp/ocl_wrapper.cl
> -index e75ed1d..cb56302 100644
> ---- a/tidl_api/dsp/ocl_wrapper.cl
> -+++ b/tidl_api/dsp/ocl_wrapper.cl
> -@@ -46,6 +46,7 @@ void ocl_tidl_initialize(global unsigned char*            createParams,
> - {
> -     // Set L1 cache to 16KB. TIDL requires 16KB of L1 scratch
> -     __cache_l1d_16k();
> -+    __cache_l2_64k();
> -
> -     ocl_dsp_tidl_initialize(createParams, netParamsBuffer,
> -                             externalMemoryHeapBase, initializeParams,
> -@@ -66,5 +67,6 @@ void ocl_tidl_process(global OCL_TIDL_ProcessParams* processParams,
> - kernel void ocl_tidl_cleanup()
> - {
> -     ocl_dsp_tidl_cleanup();
> -+    __cache_l2_128k();
> -     __cache_l1d_all();
> - }
> -diff --git a/tidl_api/src/ocl_device.cpp b/tidl_api/src/ocl_device.cpp
> -index ab0bf26..d9351cd 100644
> ---- a/tidl_api/src/ocl_device.cpp
> -+++ b/tidl_api/src/ocl_device.cpp
> -@@ -511,7 +511,7 @@ static bool CheckOpenCLVersion(cl_platform_id id)
> -     err = clGetPlatformInfo(id, CL_PLATFORM_VERSION, 0, nullptr, &length);
> -     if (err != CL_SUCCESS) return false;
> -
> --    std::unique_ptr<char> version(new char[length]);
> -+    std::unique_ptr<char[]> version(new char[length]);
> -     err = clGetPlatformInfo(id, CL_PLATFORM_VERSION, length, version.get(),
> -                             nullptr);
> -     if (err != CL_SUCCESS) return false;
> -@@ -543,7 +543,7 @@ static bool PlatformIsAM57()
> -     err = clGetPlatformInfo(id, CL_PLATFORM_NAME, 0, nullptr, &length);
> -     if (err != CL_SUCCESS) return false;
> -
> --    std::unique_ptr<char> name(new char[length]);
> -+    std::unique_ptr<char[]> name(new char[length]);
> -
> -     err = clGetPlatformInfo(id, CL_PLATFORM_NAME, length, name.get(), nullptr);
> -     if (err != CL_SUCCESS) return false;
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
> deleted file mode 100644
> index 36e8ab88..00000000
> --- a/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From aa7101256aefcea11d326740c111bf37a48b191e Mon Sep 17 00:00:00 2001
> -From: Yuan Zhao <yuanzhao@ti.com>
> -Date: Thu, 20 Jun 2019 12:01:24 -0500
> -Subject: [PATCH] Fix g++ 8.3.0 compilation error
> -
> -- Fix a syntax allowed in g++ 7.2.1 but not in 8.3.0
> -- Make should report error from loop
> -
> -Upstream-Status: Submitted [Remove this patch when next release is out]
> -
> -Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ----
> - examples/Makefile                | 2 +-
> - examples/classification/main.cpp | 2 +-
> - examples/imagenet/main.cpp       | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/examples/Makefile b/examples/Makefile
> -index 52b3ff6..9217380 100644
> ---- a/examples/Makefile
> -+++ b/examples/Makefile
> -@@ -34,7 +34,7 @@ RUN_DIRS := $(filter-out classification, $(DIRS))
> - define make_in_dirs
> - 	@for dir in $(1); do \
> - 	  echo "=============== " $$dir " =================" ; \
> --	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2); \
> -+	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2) || exit 1; \
> - 	done
> - endef
> -
> -diff --git a/examples/classification/main.cpp b/examples/classification/main.cpp
> -index 020004b..25361f8 100644
> ---- a/examples/classification/main.cpp
> -+++ b/examples/classification/main.cpp
> -@@ -699,7 +699,7 @@ int tf_postprocess(uchar *in, int size, int roi_idx, int frame_idx, int f_id)
> -   int rpt_id = -1;
> -
> -   typedef std::pair<uchar, int> val_index;
> --  auto constexpr cmp = [](val_index &left, val_index &right) { return left.first > right.first; };
> -+  auto cmp = [](val_index &left, val_index &right) { return left.first > right.first; };
> -   std::priority_queue<val_index, std::vector<val_index>, decltype(cmp)> queue(cmp);
> -   // initialize priority queue with smallest value on top
> -   for (int i = 0; i < k; i++) {
> -diff --git a/examples/imagenet/main.cpp b/examples/imagenet/main.cpp
> -index 937f467..dc1035b 100644
> ---- a/examples/imagenet/main.cpp
> -+++ b/examples/imagenet/main.cpp
> -@@ -309,7 +309,7 @@ bool WriteFrameOutput(const ExecutionObjectPipeline &eop,
> -
> -     // sort and get k largest values and corresponding indices
> -     typedef pair<unsigned char, int> val_index;
> --    auto constexpr cmp = [](val_index &left, val_index &right)
> -+    auto cmp = [](val_index &left, val_index &right)
> -                          { return left.first > right.first; };
> -     priority_queue<val_index, vector<val_index>, decltype(cmp)> queue(cmp);
> -     // initialize priority queue with smallest value on top
> ---
> -2.17.1
> -
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index d93aec82..01725245 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,5 +1,5 @@
> -PV = "1.3.0"
> -INC_PR = "r2"
> +PV = "1.3.1"
> +INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
>   
> @@ -8,9 +8,7 @@ GIT_PROTOCOL = "git"
>   BRANCH = "master"
>   
>   SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "785170685ca6a5c11876b05ddf74741c419393be"
> +SRCREV = "73efef4ab6b4c9c20f6ade372c396043e6d36b40"
>   
>   # default patchdir is ${S}
> -SRC_URI += "file://0001-tidl-api_l2_cache_size.patch"
> -SRC_URI += "file://0002-tidl-api_gcc_8.3.0_compilation.patch"
>   S = "${WORKDIR}/git"

--------------FD30C98F740EE38CDFC97614
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"
  DefSemiHidden="true" DefQFormat="false" DefPriority="99"
  LatentStyleCount="267">
  <w:LsdException Locked="false" Priority="0" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>
  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" Priority="10" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" Priority="11" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" Priority="22" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" Priority="59" SemiHidden="false"
   UnhideWhenUsed="false" Name="Table Grid"/>
  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;}
</style>
<![endif]-->
      <p class="MsoPlainText">Denys,</p>
      <p class="MsoPlainText"> Can you backport this to ti2019.03?</p>
      <p class="MsoPlainText">  <br>
      </p>
      <p class="MsoPlainText">Thanks,</p>
      <p class="MsoPlainText"> Jake</p>
    </p>
    <div class="moz-cite-prefix">On 9/6/2019 6:16 PM, Yuan Zhao wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190906221650.132984-1-yuanzhao@ti.com">
      <pre class="moz-quote-pre" wrap="">- Bug fixes

Signed-off-by: Yuan Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yuanzhao@ti.com">&lt;yuanzhao@ti.com&gt;</a>
---
 .../files/0001-tidl-api_l2_cache_size.patch        | 41 ---------------
 .../0002-tidl-api_gcc_8.3.0_compilation.patch      | 59 ----------------------
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc |  8 ++-
 3 files changed, 3 insertions(+), 105 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
 delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch

diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
deleted file mode 100644
index 84e12a18..00000000
--- a/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-diff --git a/tidl_api/dsp/ocl_wrapper.cl b/tidl_api/dsp/ocl_wrapper.cl
-index e75ed1d..cb56302 100644
---- a/tidl_api/dsp/ocl_wrapper.cl
-+++ b/tidl_api/dsp/ocl_wrapper.cl
-@@ -46,6 +46,7 @@ void ocl_tidl_initialize(global unsigned char*            createParams,
- {
-     // Set L1 cache to 16KB. TIDL requires 16KB of L1 scratch
-     __cache_l1d_16k();
-+    __cache_l2_64k();
- 
-     ocl_dsp_tidl_initialize(createParams, netParamsBuffer, 
-                             externalMemoryHeapBase, initializeParams, 
-@@ -66,5 +67,6 @@ void ocl_tidl_process(global OCL_TIDL_ProcessParams* processParams,
- kernel void ocl_tidl_cleanup()
- {
-     ocl_dsp_tidl_cleanup();
-+    __cache_l2_128k();
-     __cache_l1d_all();
- }
-diff --git a/tidl_api/src/ocl_device.cpp b/tidl_api/src/ocl_device.cpp
-index ab0bf26..d9351cd 100644
---- a/tidl_api/src/ocl_device.cpp
-+++ b/tidl_api/src/ocl_device.cpp
-@@ -511,7 +511,7 @@ static bool CheckOpenCLVersion(cl_platform_id id)
-     err = clGetPlatformInfo(id, CL_PLATFORM_VERSION, 0, nullptr, &amp;length);
-     if (err != CL_SUCCESS) return false;
- 
--    std::unique_ptr&lt;char&gt; version(new char[length]);
-+    std::unique_ptr&lt;char[]&gt; version(new char[length]);
-     err = clGetPlatformInfo(id, CL_PLATFORM_VERSION, length, version.get(),
-                             nullptr);
-     if (err != CL_SUCCESS) return false;
-@@ -543,7 +543,7 @@ static bool PlatformIsAM57()
-     err = clGetPlatformInfo(id, CL_PLATFORM_NAME, 0, nullptr, &amp;length);
-     if (err != CL_SUCCESS) return false;
- 
--    std::unique_ptr&lt;char&gt; name(new char[length]);
-+    std::unique_ptr&lt;char[]&gt; name(new char[length]);
- 
-     err = clGetPlatformInfo(id, CL_PLATFORM_NAME, length, name.get(), nullptr);
-     if (err != CL_SUCCESS) return false;
diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
deleted file mode 100644
index 36e8ab88..00000000
--- a/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0_compilation.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From aa7101256aefcea11d326740c111bf37a48b191e Mon Sep 17 00:00:00 2001
-From: Yuan Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yuanzhao@ti.com">&lt;yuanzhao@ti.com&gt;</a>
-Date: Thu, 20 Jun 2019 12:01:24 -0500
-Subject: [PATCH] Fix g++ 8.3.0 compilation error
-
-- Fix a syntax allowed in g++ 7.2.1 but not in 8.3.0
-- Make should report error from loop
-
-Upstream-Status: Submitted [Remove this patch when next release is out]
-
-Signed-off-by: Yuan Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yuanzhao@ti.com">&lt;yuanzhao@ti.com&gt;</a>
----
- examples/Makefile                | 2 +-
- examples/classification/main.cpp | 2 +-
- examples/imagenet/main.cpp       | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/examples/Makefile b/examples/Makefile
-index 52b3ff6..9217380 100644
---- a/examples/Makefile
-+++ b/examples/Makefile
-@@ -34,7 +34,7 @@ RUN_DIRS := $(filter-out classification, $(DIRS))
- define make_in_dirs
- 	@for dir in $(1); do \
- 	  echo "=============== " $$dir " =================" ; \
--	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2); \
-+	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2) || exit 1; \
- 	done
- endef
- 
-diff --git a/examples/classification/main.cpp b/examples/classification/main.cpp
-index 020004b..25361f8 100644
---- a/examples/classification/main.cpp
-+++ b/examples/classification/main.cpp
-@@ -699,7 +699,7 @@ int tf_postprocess(uchar *in, int size, int roi_idx, int frame_idx, int f_id)
-   int rpt_id = -1;
- 
-   typedef std::pair&lt;uchar, int&gt; val_index;
--  auto constexpr cmp = [](val_index &amp;left, val_index &amp;right) { return left.first &gt; right.first; };
-+  auto cmp = [](val_index &amp;left, val_index &amp;right) { return left.first &gt; right.first; };
-   std::priority_queue&lt;val_index, std::vector&lt;val_index&gt;, decltype(cmp)&gt; queue(cmp);
-   // initialize priority queue with smallest value on top
-   for (int i = 0; i &lt; k; i++) {
-diff --git a/examples/imagenet/main.cpp b/examples/imagenet/main.cpp
-index 937f467..dc1035b 100644
---- a/examples/imagenet/main.cpp
-+++ b/examples/imagenet/main.cpp
-@@ -309,7 +309,7 @@ bool WriteFrameOutput(const ExecutionObjectPipeline &amp;eop,
- 
-     // sort and get k largest values and corresponding indices
-     typedef pair&lt;unsigned char, int&gt; val_index;
--    auto constexpr cmp = [](val_index &amp;left, val_index &amp;right)
-+    auto cmp = [](val_index &amp;left, val_index &amp;right)
-                          { return left.first &gt; right.first; };
-     priority_queue&lt;val_index, vector&lt;val_index&gt;, decltype(cmp)&gt; queue(cmp);
-     // initialize priority queue with smallest value on top
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index d93aec82..01725245 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,5 +1,5 @@
-PV = "1.3.0"
-INC_PR = "r2"
+PV = "1.3.1"
+INC_PR = "r0"
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118">"file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"</a>
 
@@ -8,9 +8,7 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "785170685ca6a5c11876b05ddf74741c419393be"
+SRCREV = "73efef4ab6b4c9c20f6ade372c396043e6d36b40"
 
 # default patchdir is ${S}
-SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-tidl-api_l2_cache_size.patch">"file://0001-tidl-api_l2_cache_size.patch"</a>
-SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0002-tidl-api_gcc_8.3.0_compilation.patch">"file://0002-tidl-api_gcc_8.3.0_compilation.patch"</a>
 S = "${WORKDIR}/git"
</pre>
    </blockquote>
  </body>
</html>

--------------FD30C98F740EE38CDFC97614--
