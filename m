Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C06DF520E1
	for <meta-arago@arago-project.org>;
	Thu,  6 Jun 2019 20:04:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x56K3N9W125389
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2019 15:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559851403;
	bh=/h8n2pGdAiuNBlhrGGIrJcS1aBWcWHV2Ia1YEIc78hM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LW5ypQol25S/Q2oO5Nx3UQ+cyHUGmoHDmbS5IB70s1FO6oqMGqD6mWGwuK8q9kqNc
	ENWMR9KKt8XqEAg5Y3doL2pn0PpuuFNFKxL795fQj2HFicYV9MoATjhkNyq0rAjPj0
	+6IpbxpX38x0DKRNsNy70BOIzvHbLVuqq4MmjjmU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x56K3MMj126440
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2019 15:03:23 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 6 Jun 2019 15:03:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 6 Jun 2019 15:03:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x56K3MaU081009;
	Thu, 6 Jun 2019 15:03:22 -0500
Date: Thu, 6 Jun 2019 16:03:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Xu, Jianzhong" <xuj@ti.com>
Message-ID: <20190606200322.GJ2696@beryl>
References: <1559837111-24886-1-git-send-email-j-stiffler@ti.com>
	<fdc06d4adb424ba481838318a6be8de5@ti.com>
MIME-Version: 1.0
In-Reply-To: <fdc06d4adb424ba481838318a6be8de5@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/master][PATCH v2] tidl-import: disable static linking
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
X-List-Received-Date: Thu, 06 Jun 2019 20:04:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sorry, this was already merged and tested. You'd have to drop the local patch 
once you get it integrated into the makefile.

Denys


On Thu, Jun 06, 2019 at 07:15:53PM +0000, Xu, Jianzhong wrote:
> NAK.
> 
> I will fix the makefile in the source (confirmed with Jake). 
> 
> Thanks,
> Jianzhong
> 
> -----Original Message-----
> From: Stiffler, Jacob 
> Sent: Thursday, June 06, 2019 12:05 PM
> To: meta-arago@arago-project.org
> Cc: Xu, Jianzhong; Stiffler, Jacob
> Subject: [thud/master][PATCH v2] tidl-import: disable static linking
> 
> * Disable static linking to fix run-time against protobuf 3.6.1
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v2 changes: drop FILESEXTRAPATHS
> 
>  .../tidl-utils/tidl-import/disable_static.patch          | 16 ++++++++++++++++
>  .../recipes-ti/tidl-utils/tidl-import_git.bb             |  4 +++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
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
> index bef2d1a..9f1c5bb 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> @@ -8,7 +8,9 @@ LICENSE = "BSD-3"
>  LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;md5=cabe1fdaabfa0d85dc5544566b0e2425"
>  
>  PV = "01.01.00.00"
> -PR = "r0"
> +PR = "r1"
> +
> +SRC_URI_append = " file://disable_static.patch;pnum=3"
>  
>  S = "${WORKDIR}/git/src/importTool/"
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

