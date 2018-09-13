Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9093852993
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 16:18:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DGIaKO065836
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 11:18:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536855516;
	bh=H5V50P6kckpWla6wnL+V1JEVolQuAdU+7wlxJP9/qI8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Uq/ZLWL6/iSRnNWbS0WGZdk7tUquiuzLt/n8ihEYAhpdtGAufHdt5kKLk9f6Cqg3w
	oOzmmMMqjcpwndq+C8NBn/1oQGT/Ai542MprUirtUMwD/InvVvrv0b/DAxkex9gdq0
	ahbFtqYBUscpqtbt8MZL6cTCMNTVgnbq8xOuXU14=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DGIaoV005484
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 11:18:36 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 11:18:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 11:18:36 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DGIZqZ030778;
	Thu, 13 Sep 2018 11:18:35 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1536671434-7121-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c4b18fd0-e5fd-b2d9-bbb2-25671111648b@ti.com>
Date: Thu, 13 Sep 2018 12:18:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536671434-7121-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [rocko/master][PATCH] matrix-gui: tidl: Fix package names
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
X-List-Received-Date: Thu, 13 Sep 2018 16:18:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/11/2018 9:10 AM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../recipes-core/matrix/matrix-gui-apps-git.inc    |  4 ++--
>   .../matrix/matrix-gui-tidl-demos_2.0.bb            | 24 +++++++++++-----------
>   2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index bbb4f2d..3620e85 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>   LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>   
>   SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "55f8e4baec0bf28ad475038fb1e20fbde4abf751"
> +SRCREV = "1fab50f6ceac640bf946e8716a68b1c827256489"
>   BRANCH = "master"
> -INC_PR = "r56"
> +INC_PR = "r57"
>   
>   # Pull in the base package for installing matrix applications
>   require matrix-gui-apps.inc
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
> index 8a9fb5a..33d0af7 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
> @@ -15,22 +15,22 @@ TIDLDEMO_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-tidl"
>   FILES_${PN} += "${MATRIX_BASE_DIR}/*"
>   
>   PACKAGES = "matrix-tidl-demo-staticimg \
> -            matrix-tidl-demo-staticimg_lg2 \
> -            matrix-tidl-demo-staticimg_dsponly \
> +            matrix-tidl-demo-staticimg-lg2 \
> +            matrix-tidl-demo-staticimg-dsponly \
>               matrix-tidl-demo-pnexamples \
>               matrix-tidl-demo-livecam \
> -            matrix-tidl-demo-livecam_lg2 \
> +            matrix-tidl-demo-livecam-lg2 \
>   "
>   
>   RDEPENDS_matrix-tidl-demo-staticimg = " \
>       ${TIDLDEMO_RDEPENDS} \
>   "
>   
> -RDEPENDS_matrix-tidl-demo-staticimg_lg2 = " \
> +RDEPENDS_matrix-tidl-demo-staticimg-lg2 = " \
>       ${TIDLDEMO_RDEPENDS} \
>   "
>   
> -RDEPENDS_matrix-tidl-demo-staticimg_dsponly = " \
> +RDEPENDS_matrix-tidl-demo-staticimg-dsponly = " \
>       ${TIDLDEMO_RDEPENDS} \
>   "
>   
> @@ -42,18 +42,18 @@ RDEPENDS_matrix-tidl-demo-livecam = " \
>       ${TIDLDEMO_RDEPENDS} \
>   "
>   
> -RDEPENDS_matrix-tidl-demo-livecam_lg2 = " \
> +RDEPENDS_matrix-tidl-demo-livecam-lg2 = " \
>       ${TIDLDEMO_RDEPENDS} \
>   "
>   
>   FILES_matrix-tidl-demo-staticimg = "${MATRIX_APP_DIR}/tidl_demo_staticimg/*"
>   FILES_matrix-tidl-demo-staticimg += "${bindir}/runTidlStaticImg.sh"
>   
> -FILES_matrix-tidl-demo-staticimg_lg2 = "${MATRIX_APP_DIR}/tidl_demo_staticimg_lg2/*"
> -FILES_matrix-tidl-demo-staticimg_lg2 += "${bindir}/runTidlStaticImg_lg2.sh"
> +FILES_matrix-tidl-demo-staticimg-lg2 = "${MATRIX_APP_DIR}/tidl_demo_staticimg_lg2/*"
> +FILES_matrix-tidl-demo-staticimg-lg2 += "${bindir}/runTidlStaticImg_lg2.sh"
>   
> -FILES_matrix-tidl-demo-staticimg_dsponly = "${MATRIX_APP_DIR}/tidl_demo_staticimg_dsponly/*"
> -FILES_matrix-tidl-demo-staticimg_dsponly += "${bindir}/runTidlStaticImg_dsponly.sh"
> +FILES_matrix-tidl-demo-staticimg-dsponly = "${MATRIX_APP_DIR}/tidl_demo_staticimg_dsponly/*"
> +FILES_matrix-tidl-demo-staticimg-dsponly += "${bindir}/runTidlStaticImg_dsponly.sh"
>   
>   FILES_matrix-tidl-demo-pnexamples = "${MATRIX_APP_DIR}/tidl_demo_pnexamples/*"
>   FILES_matrix-tidl-demo-pnexamples += "${bindir}/runTidlPnExamples.sh"
> @@ -61,5 +61,5 @@ FILES_matrix-tidl-demo-pnexamples += "${bindir}/runTidlPnExamples.sh"
>   FILES_matrix-tidl-demo-livecam   = "${MATRIX_APP_DIR}/tidl_demo_livecam/*"
>   FILES_matrix-tidl-demo-livecam   += "${bindir}/runTidlLiveCam.sh"
>   
> -FILES_matrix-tidl-demo-livecam_lg2  = "${MATRIX_APP_DIR}/tidl_demo_livecam_lg2/*"
> -FILES_matrix-tidl-demo-livecam_lg2  += "${bindir}/runTidlLiveCam_lg2.sh"
> +FILES_matrix-tidl-demo-livecam-lg2  = "${MATRIX_APP_DIR}/tidl_demo_livecam_lg2/*"
> +FILES_matrix-tidl-demo-livecam-lg2  += "${bindir}/runTidlLiveCam_lg2.sh"


