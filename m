Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E45D3529B9
	for <meta-arago@arago-project.org>;
	Tue, 17 Sep 2019 14:15:35 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HEESnN122378
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2019 09:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568729668;
	bh=HHjn4m51MiJPtovZesf5HCLvzPr0MM3da/rqGFSNn2A=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=s9VwKLW4p7okySvDgnUvL8M3Rh4708QDZV9HUFMsYrAd586WUyR28FeSRrg+wo595
	li2Ix3/0e3o2UiNv7HKCrMJzbEwd+qNZ1M2/uwtoVERM6XSUZabjgjTaDuUCywEyxh
	gzwlV7bVu9BNY55MY0kkEOy0AwQAxftax3ez4bnk=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8HEES27075569
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2019 09:14:28 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 17 Sep 2019 09:14:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 17 Sep 2019 09:14:28 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HEERcr092535;
	Tue, 17 Sep 2019 09:14:27 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20190916202509.44546-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <54afa305-2721-789d-f3bd-59c5bf1e09db@ti.com>
Date: Tue, 17 Sep 2019 10:14:24 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916202509.44546-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] ocl: update version to 01.01.19.01
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
X-List-Received-Date: Tue, 17 Sep 2019 14:15:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport this to ti2019.03.


Thanks,

Jake

On 9/16/2019 4:25 PM, Yuan Zhao wrote:
> - Runtime support update for TIDL API 01.03.02
> - Update OpenCL TIDL firmware to 01.01.19.01
>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/ocl/ocl.inc               | 4 ++--
>   meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index f6775299..1bfb47d2 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,5 +1,5 @@
>   # patch version at the end needs to be in double digits
> -PV = "1.1.19.00"
> +PV = "1.1.19.01"
>   INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -11,7 +11,7 @@ OCL_GIT_PROTOCOL = "git"
>   OCL_GIT_BRANCH = "master"
>   
>   
> -OCL_SRCREV = "0f4be82079ba6ec9c7c8ee00f879c9f6f0ad4803"
> +OCL_SRCREV = "517b95417982e001cda8948509fcc75e0a5b2f14"
>   
>   BRANCH = "${OCL_GIT_BRANCH}"
>   SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> index 64dfd0d7..96901c16 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> @@ -3,7 +3,7 @@ SUMMARY = "OpenCL TIDL firmware for AM57xx"
>   LICENSE = "TI-TFL"
>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
>   
> -PV = "01.01.19.00"
> +PV = "01.01.19.01"
>   PR = "r0"
>   
>   require recipes-ti/includes/arago-paths.inc
> @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
>   GIT_PROTOCOL = "git"
>   BRANCH       = "master"
> -SRCREV       = "32772d41ae6978b0ec66173d2bfc8c041017bda1"
> +SRCREV       = "6124427f1eb33fa2afb5152442f4eca930ffd10a"
>   
>   SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
>   

