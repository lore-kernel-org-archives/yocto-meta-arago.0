Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id ACC165298D
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 17:23:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4HNh5e014754
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 11:23:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543944223;
	bh=qjVE7F6MfQhliQ6ru+GRFK3A755igotgcdrjPynzxP4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=d7Xo4/FwAeKXLjzCQWHyh/7hK03rTZyITDHN95ZX+siH1AU9fb7iqbd44pbppul0p
	3JNQYOqHUJmKXdnIHwY31EYGUTX6QtEQ7Z+0YptqJLU9FBDeJe7s363OZoP8ZbSoER
	voy3yQXQdRnFcD8xK11Dpm3qWIOVKE1pFTblkIv0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4HNhQ0102012
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 11:23:43 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 11:23:42 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 11:23:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4HNgFN014987;
	Tue, 4 Dec 2018 11:23:42 -0600
Date: Tue, 4 Dec 2018 12:23:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yuan Zhao <yuanzhao@ti.com>
Message-ID: <20181204172342.GL6887@beryl>
References: <20181130164135.101859-1-yuanzhao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20181130164135.101859-1-yuanzhao@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ocl: update opencl tidl firmware to 01.01.17.01
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
X-List-Received-Date: Tue, 04 Dec 2018 17:23:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

ACK.

Is it dependent on the tidl update?


On Fri, Nov 30, 2018 at 10:41:35AM -0600, Yuan Zhao wrote:
> - firmware is built with latest TIDL library v1.1.2.2 for PSDK v5.2
> - firmware will be built into opencl monitors
> 
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/ocl.inc               | 2 +-
>  meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index 3450a400..96d1836f 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,6 +1,6 @@
>  # patch version at the end needs to be in double digits
>  PV = "1.1.17.01"
> -INC_PR = "r0"
> +INC_PR = "r1"
>  
>  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
>  
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> index 221e0d62..a47d9128 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> @@ -3,7 +3,7 @@ SUMMARY = "OpenCL TIDL firmware for AM57xx"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
>  
> -PV = "01.01.16.00"
> +PV = "01.01.17.01"
>  PR = "r0"
>  
>  require recipes-ti/includes/arago-paths.inc
> @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
>  GIT_PROTOCOL = "git"
>  BRANCH       = "master"
> -SRCREV       = "185e13d273fbbbbdb007111f87855f43c03535fa"
> +SRCREV       = "2f1715affab9ef4debf02769cf113dc1922cf75f"
>  
>  SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
>  
> -- 
> 2.14.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

