Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A36A65298C
	for <meta-arago@arago-project.org>;
	Wed, 28 Oct 2015 13:18:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9SDIEJT025537
	for <meta-arago@arago-project.org>; Wed, 28 Oct 2015 08:18:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9SDIE4l010063
	for <meta-arago@arago-project.org>; Wed, 28 Oct 2015 08:18:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 28 Oct 2015 08:18:14 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9SDIEUb009290	for
	<meta-arago@arago-project.org>; Wed, 28 Oct 2015 08:18:14 -0500
Message-ID: <5630CB16.4050204@ti.com>
Date: Wed, 28 Oct 2015 09:18:14 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1445884768-3082-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1445884768-3082-1-git-send-email-j-stiffler@ti.com>
Subject: Re: [PATCH] ocl: Extract git SRC_URI parameters into individual variables
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
X-List-Received-Date: Wed, 28 Oct 2015 13:18:16 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I will be submitting a v2. After thinking about this more, I would like 
to also create a new variable for SRCREV.

On 10/26/2015 2:39 PM, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   meta-arago-extras/recipes-ti/ocl/ocl.inc | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index adf65e0..c2515f7 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120
>   
>   FILESEXTRAPATHS_prepend := "${THISDIR}/ocl:"
>   
> -BRANCH = "master"
> -SRC_URI = "git://git.ti.com/opencl/ti-opencl.git;protocol=git;branch=${BRANCH}"
> +OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
> +OCL_GIT_PROTOCOL = "git"
> +OCL_GIT_BRANCH = "master"
> +
> +SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${OCL_GIT_BRANCH}"
>   SRCREV = "992dfba8783af895f6d4e4877ad7c0466d085bf0"


