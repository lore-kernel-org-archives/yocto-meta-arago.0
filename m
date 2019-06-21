Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id BAA8B52980
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 13:01:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LD15pj020227
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561122065;
	bh=NE/gEl2iwfND7ytaOGSg3worIhNjsptrCfbb7VutfEM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Lx1yGrFhiKLbIzmWPqaVMFYa44tWqyxm9vcSwKoX9nPgQG63SGyLY+xzHAt0OrmPG
	PXs50kAs1mS9bf3MvYXZV2egDhN5feKzJOP5nK4fwkWU92tUzAJWrqAUe5zieMXe8e
	y9uW+zoUMM3S+mOQ/Pko9OjTChZ4vYwNllcWEz/Q=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LD15W5072382
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:01:05 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 08:01:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 08:01:05 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LD15bQ036532;
	Fri, 21 Jun 2019 08:01:05 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190619180712.17144-1-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <372c048c-920a-38e3-4f42-25fd98ca7e9c@ti.com>
Date: Fri, 21 Jun 2019 09:01:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619180712.17144-1-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] opencl: Add opencl to dra76 build
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
X-List-Received-Date: Fri, 21 Jun 2019 13:01:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake


On 6/19/2019 2:07 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-opencl.bb            | 1 +
>   meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb      | 2 +-
>   meta-arago-extras/recipes-ti/ocl/opencl_git.bb                  | 1 +
>   3 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
> index b96f62d0..b33930c2 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
> @@ -25,6 +25,7 @@ EXTRA_PKGS_append_k2hk = " \
>   
>   EXTRA_PKGS_append_dra7xx = " \
>       linalg-examples \
> +    opencl-examples \
>   "
>   
>   RDEPENDS_${PN} = "\
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> index c2552416..003889c2 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
> @@ -20,7 +20,7 @@ DEPENDS = " common-csl-ip-rtos \
>               opencl-tidl-fw \
>   "
>   
> -COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
> +COMPATIBLE_MACHINE = "dra7xx-evm|am57xx-evm|am57xx-hs-evm"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   S = "${WORKDIR}/git/monitor_ipu"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> index 46db2fed..8b363573 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> @@ -39,6 +39,7 @@ DEPENDS_remove_k2g = " libulm"
>   MONITORS                      = " opencl-monitor"
>   MONITORS_append_am57xx-evm    = " opencl-monitor-ipu"
>   MONITORS_append_am57xx-hs-evm = " opencl-monitor-ipu"
> +MONITORS_append_dra7xx        = " opencl-monitor-ipu"
>   
>   RDEPENDS_${PN} += " bash"
>   RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"

