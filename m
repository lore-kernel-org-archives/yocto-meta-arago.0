Return-Path: <hzhang@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 62FF452A6D
	for <meta-arago@arago-project.org>;
	Mon, 22 Jun 2015 15:33:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5MFXbux019179
	for <meta-arago@arago-project.org>; Mon, 22 Jun 2015 10:33:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5MFXaVK007582
	for <meta-arago@arago-project.org>; Mon, 22 Jun 2015 10:33:37 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 22 Jun 2015 10:33:36 -0500
Received: from [158.218.103.160] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5MFXa7B029528	for
	<meta-arago@arago-project.org>; Mon, 22 Jun 2015 10:33:36 -0500
Message-ID: <55882AD1.3030500@ti.com>
Date: Mon, 22 Jun 2015 11:33:37 -0400
From: Hao Zhang <hzhang@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <1434638886-30181-1-git-send-email-hzhang@ti.com>
In-Reply-To: <1434638886-30181-1-git-send-email-hzhang@ti.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] keystone: recovery kernel: Add dependency on device tree compiler
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
X-List-Received-Date: Mon, 22 Jun 2015 15:33:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Ping.

On 6/18/2015 10:48 AM, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  .../recovery-kernel/recovery-kernel_1.0.bb         |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
> index 6e4f9c7..3fc631b 100644
> --- a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
> +++ b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
> @@ -1,7 +1,10 @@
>  DESCRIPTION = "Recovery kernel building for Keystone EVM"
>  LICENSE = "GPLv2"
>  
> -PR = "r3"
> +# recovery kernel needs devtree compiler to add padding bytes
> +DEPENDS += "dtc-native"
> +
> +PR = "r4"
>  COMPATIBLE_MACHINE = "keystone"
>  BRANCH = "v3.10.72/master"
>  SRCREV = "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
> 


