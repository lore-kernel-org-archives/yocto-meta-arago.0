Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3683D529D8
	for <meta-arago@arago-project.org>;
	Thu,  6 Jun 2019 16:20:25 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x56GJlYk030205
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2019 11:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559837987;
	bh=GcaBmNg7aIaEOhoK5jiC7BD5LGvzrVQzKMCnNqMqe+Y=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=av15ivuBAA4UE7N8F4fp1Md/leXCYb/s5RufnjR+NLnUw3VrwCEyjSeEUiFzcqnB5
	sB8lGzr/xnir3ctaFsGeCDDEAvklK6sUqe/4C4ttstDuq9jn4Isi8Und3seTiwYL49
	GsCOyWigd6f2Fr0blCw4ivnoDiSqpOUhXW9cafg0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x56GJlMA123476
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2019 11:19:47 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 6 Jun 2019 11:19:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 6 Jun 2019 11:19:46 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x56GJjs8038020;
	Thu, 6 Jun 2019 11:19:45 -0500
To: <meta-arago@arago-project.org>
References: <1559836869-12921-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <04b26f9e-c9f5-1e01-b0c4-d94bae31a438@ti.com>
Date: Thu, 6 Jun 2019 12:19:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559836869-12921-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [thud/master][PATCH] tidl-import: disable static linking
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
X-List-Received-Date: Thu, 06 Jun 2019 16:20:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/6/2019 12:01 PM, Jacob Stiffler wrote:
> * Disable static linking to fix run-time against protobuf 3.6.1
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../tidl-utils/tidl-import/disable_static.patch          | 16 ++++++++++++++++
>   .../recipes-ti/tidl-utils/tidl-import_git.bb             |  5 ++++-
>   2 files changed, 20 insertions(+), 1 deletion(-)
>   create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
> new file mode 100644
> index 0000000..23377af
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
> @@ -0,0 +1,16 @@
> +diff --git a/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile b/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
> +index 374f862..521f0dc 100644
> +--- a/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
> ++++ b/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
> +@@ -103,9 +103,9 @@ ifeq ($(PLATFORM_BUILD), x86)
> + ifeq ($(LINUX_IMPORT_TOOL), 64BIT)
> + CFLAGS+= -DPLATFORM_64BIT
> + endif
> +-LDFLAGS+= -lstdc++ -static
> ++LDFLAGS+= -lstdc++
> + else
> +-LDFLAGS+= -lstdc++ -lz -static
> ++LDFLAGS+= -lstdc++ -lz
> + endif
> + endif
> +
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> index bef2d1a..72dd169 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> @@ -8,7 +8,10 @@ LICENSE = "BSD-3"
>   LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;md5=cabe1fdaabfa0d85dc5544566b0e2425"
>   
>   PV = "01.01.00.00"
> -PR = "r0"
> +PR = "r1"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}:"

This shouldn't be needed. I'll resubmit.


> +SRC_URI_append = " file://disable_static.patch;pnum=3"
>   
>   S = "${WORKDIR}/git/src/importTool/"
>   

