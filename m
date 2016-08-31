Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C13FB52A3C
	for <meta-arago@arago-project.org>;
	Wed, 31 Aug 2016 18:50:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7VIons0003702
	for <meta-arago@arago-project.org>; Wed, 31 Aug 2016 13:50:49 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7VIolSs027856
	for <meta-arago@arago-project.org>; Wed, 31 Aug 2016 13:50:47 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 31 Aug 2016 13:50:47 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7VIolNv029758;
	Wed, 31 Aug 2016 13:50:47 -0500
To: Jianzhong Xu <xuj@ti.com>, <meta-arago@arago-project.org>
References: <1472668731-10379-1-git-send-email-xuj@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <10acca78-6f0f-74a3-2e51-4cbc7655095c@ti.com>
Date: Wed, 31 Aug 2016 14:50:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1472668731-10379-1-git-send-email-xuj@ti.com>
Subject: Re: [PATCH] linalg: Stop making and exit when there is compilation error.
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
X-List-Received-Date: Wed, 31 Aug 2016 18:50:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ACK


Tested-by: Jacob Stiffler <j-stiffler@ti.com>


On 8/31/2016 2:38 PM, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>   meta-arago-extras/recipes-ti/linalg/linalg.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> index 31ea34b..dabe3f6 100644
> --- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
> +++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> @@ -2,7 +2,7 @@ HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
>   LICENSE = "BSD-3-Clause"
>   
>   PV = "1_2_0_0"
> -INC_PR = "r6"
> +INC_PR = "r7"
>   
>   S = "${WORKDIR}/git"
>   
> @@ -12,7 +12,7 @@ require recipes-ti/includes/ti-staging.inc
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH}"
>   LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
> -SRCREV = "8e8a82255d8599c4093fcbe754cb34eb9d765b8c"
> +SRCREV = "01960b319783b29aacf12b2a72606b28d657b78e"
>   
>   DEPENDS = "common-csl-ip \
>              libarch \


