Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0FC065297D
	for <meta-arago@arago-project.org>;
	Wed, 29 Mar 2017 17:53:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2THrJND003267
	for <meta-arago@arago-project.org>; Wed, 29 Mar 2017 12:53:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490810000;
	bh=AglRG2oumCyzap8BnPswaxkHqPQOqFy7+GJzlg2hdqQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CrKyRBOR/bPyVymsalCbLeMe7XAtPFn8imJ7Z1kr+viSG9Qha3s+1rDF60foug9yq
	aNST4hUisukguZIAbxemm7pzgRAq2us2ZI9lLUPAowP/THpVNiz1XA8jhFKUvAzz0p
	egSskgdGiD2pELQk8E5ET8lIXqu/k9HesrVENl2c=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2THrEEh029642
	for <meta-arago@arago-project.org>; Wed, 29 Mar 2017 12:53:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Mar 2017 12:53:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2THrEIV029701;
	Wed, 29 Mar 2017 12:53:14 -0500
Date: Wed, 29 Mar 2017 13:53:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20170329175311.GE11364@edge>
References: <1490809856-2829-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1490809856-2829-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Djordje Senicic <d-senicic1@ti.com>
Subject: Re: [morty/krogoth][PATCH 3/4 v3] matrix-gui-machinevision-demos: add simple-people-tracking demo
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
X-List-Received-Date: Wed, 29 Mar 2017 17:53:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hongmei,

Thanks. Would you mind re-submitting the entire series again with all the 
latest patches? It's getting hard for me to pick and choose the right 
revisions by now... Thanks.

-- 
Denys


On Wed, Mar 29, 2017 at 01:50:56PM -0400, Hongmei Gou wrote:
> Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
> V3 changes:
> * Remove voxelsdk dependency.
>   voxelsdk has been added through packagegroup. 
> 
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc  |  4 ++--
>  .../recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb  | 10 +++++++++-
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 02156c8..0ae0d21 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "b96f7c7365c166bf59abf6486912eaad2e0ad607"
> +SRCREV = "7ab39e827e65c35f4e37d1142a45071f670395fe"
>  BRANCH = "master"
> -INC_PR = "r45"
> +INC_PR = "r46"
>  
>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
> index 9c7eb92..4adb7bc 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
>  
>  require recipes-core/matrix/matrix-gui-apps-git.inc
>  
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>  
>  inherit allarch
>  
> @@ -17,6 +17,7 @@ FILES_${PN} += "${MATRIX_BASE_DIR}/*"
>  PACKAGES = "matrix-machinevision-demo-dlp3dscanner \
>              matrix-machinevision-demo-barcoderoi \
>              matrix-machinevision-demo-barcoderoi-f2f \
> +            matrix-machinevision-demo-simplepeopletracking \
>  "
>  
>  RDEPENDS_matrix-machinevision-demo-dlp3dscanner_dra7xx = " \
> @@ -34,6 +35,10 @@ RDEPENDS_matrix-machinevision-demo-barcoderoi-f2f = " \
>      barcode-roi \
>  "
>  
> +RDEPENDS_matrix-machinevision-demo-simplepeopletracking = " \
> +    ${MACHINEVISION_RDEPENDS} \
> +"
> +
>  FILES_matrix-machinevision-demo-dlp3dscanner    = "${MATRIX_APP_DIR}/machinevision_dlp_3d_scanner/*"
>  FILES_matrix-machinevision-demo-dlp3dscanner   += "${bindir}/runDlp3DScanner.sh"
>  
> @@ -41,3 +46,6 @@ FILES_matrix-machinevision-demo-barcoderoi    = "${MATRIX_APP_DIR}/machinevision
>  FILES_matrix-machinevision-demo-barcoderoi   += "${bindir}/runBarcodeRoi.sh"
>  FILES_matrix-machinevision-demo-barcoderoi-f2f = "${MATRIX_APP_DIR}/machinevision_barcode_roi_f2f/*"
>  FILES_matrix-machinevision-demo-barcoderoi-f2f += "${bindir}/runBarcodeRoiSave2File.sh"
> +
> +FILES_matrix-machinevision-demo-simplepeopletracking   = "${MATRIX_APP_DIR}/machinevision_simple_people_tracking/*"
> +FILES_matrix-machinevision-demo-simplepeopletracking   += "${bindir}/runSimplePeopleTracking.sh"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

