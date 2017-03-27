Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 916A4520C1
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 12:23:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RCMrIS018629
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 07:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490617373;
	bh=7rNFFdLCde0fIhMVdKzgJSxP0XtN/RcHJvboico9h7k=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=F0xhLSTCNWVl2aMrjL/BZq0u92Pu7sA5g6tJc1C1oB6/7cY5qhmuyhqGy6b61h5e1
	XnHMxZAyaUAM6CxkdU8FsDKOA2roLcw8akXlEEhp+mNZOp57LvNKDcxeflelRyiMIq
	uMftI28P3emDhfLKScQhEnxrI6iGST0yU6tKV6hU=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RCMmE8001159
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 07:22:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 07:22:48 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RCMmBD015538;
	Mon, 27 Mar 2017 07:22:48 -0500
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
References: <1488297560-24159-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4c5c42df-4829-4751-01fc-cb89141e7df9@ti.com>
Date: Mon, 27 Mar 2017 08:22:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1488297560-24159-1-git-send-email-j-stiffler@ti.com>
Subject: Re: [krogoth/morty/master][PATCH 1/2] packagegroup-arago-tisdk-opencl*: add linalg for dra7xx
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
X-List-Received-Date: Mon, 27 Mar 2017 12:23:11 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,


I see that this got applied to master/morty, but not to krogoth. Can you 
please also apply this to the krogoth branch?


Thank you,

Jake


On 2/28/2017 10:59 AM, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb       | 6 +++++-
>   .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb     | 6 +++++-
>   .../recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb   | 6 +++++-
>   3 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
> index aac2472..0e0e112 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Task to install sources for OpenCL/MP apps and demos"
>   LICENSE = "MIT"
> -PR = "r0"
> +PR = "r1"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -15,6 +15,10 @@ UTILS_append_k2hk-evm = " \
>       linalg-examples-src \
>   "
>   
> +UTILS_append_dra7xx = " \
> +    linalg-examples-src \
> +"
> +
>   RDEPENDS_${PN} = "\
>       ${UTILS} \
>   "
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
> index ac235f0..ea0f724 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Task to install headers and libraries of OpenCL/MP and related components"
>   LICENSE = "MIT"
> -PR = "r1"
> +PR = "r2"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -16,6 +16,10 @@ UTILS_append_k2hk-evm = " \
>       linalg-dev \
>   "
>   
> +UTILS_append_dra7xx = " \
> +    linalg-dev \
> +"
> +
>   RDEPENDS_${PN} = "\
>       ${UTILS} \
>   "
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
> index 6898dd6..e882e2a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Task to install OpenCL/MP and related components"
>   LICENSE = "MIT"
> -PR = "r1"
> +PR = "r2"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -23,6 +23,10 @@ EXTRA_PKGS_append_k2hk-evm = " \
>       linalg-examples \
>   "
>   
> +EXTRA_PKGS_append_dra7xx = " \
> +    linalg-examples \
> +"
> +
>   RDEPENDS_${PN} = "\
>       ${MAIN_PKGS} \
>   "


