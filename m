Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3F14B52AC0
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 17:26:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7THQ6ju014930
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504027566;
	bh=6eqtwx5JA2ITmlyiCOr435/XX9MUTMs+wLBDGxzie8U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=n243yzEyN1YnaJU5gd+6qdMfKoa9DUIhXG4DaFH6XegsLRM+IG4TnzXEJL0wayBUD
	+jDLlh49MHwualuqruBAhUgDEvE82VoRdfAbfGlaQOo3tuOJaOYdcQAIsMeSp0drhc
	36sZLkNOcC4HqImRvwlFVwyWy+Waj05ijEv4EHuM=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THQ6ss016138
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:26:06 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 12:26:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 12:26:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THQ5uL007828;
	Tue, 29 Aug 2017 12:26:05 -0500
Date: Tue, 29 Aug 2017 13:26:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20170829172601.GG8304@edge>
References: <20170829163826.15777-1-manisha.agrawal@ti.com>
	<20170829163826.15777-2-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170829163826.15777-2-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v2 2/6] matrix : add new EVSE HMI demo
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
X-List-Received-Date: Tue, 29 Aug 2017 17:26:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This one looks good, thanks.


On Tue, Aug 29, 2017 at 11:38:22AM -0500, Manisha Agrawal wrote:
> Create sub menu for HMI
> Update the matrix revision for matrix-gui-upadte-v2
> 
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc    | 4 ++--
>  meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index b805f5e..551416d 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "38afccb5335216ececa874cf4cf72a67c4164fc3"
> +SRCREV = "50a2f2ec7043e17bc7af72186e3d0a8d7773ec0a"
>  BRANCH = "master"
> -INC_PR = "r47"
> +INC_PR = "r48"
>  
>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
> index f592f7a..b9973dd 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
> @@ -35,6 +35,7 @@ SUBMENUS = " arm_submenu \
>               machinevision_submenu \
>               touch_submenu \
>               browser_submenu \
> +	     hmi_submenu \
>  "
>  
>  do_install(){
> @@ -68,6 +69,7 @@ PACKAGES += " ${PN}-arm \
>                ${PN}-machinevision \
>                ${PN}-touch \
>                ${PN}-browser \
> +              ${PN}-hmi \
>  "
>  
>  # Make sure app images has been installed
> @@ -96,3 +98,4 @@ FILES_${PN}-videoanalytics = "${MATRIX_APP_DIR}/videoanalytics_submenu/*"
>  FILES_${PN}-machinevision = "${MATRIX_APP_DIR}/machinevision_submenu/*"
>  FILES_${PN}-touch = "${MATRIX_APP_DIR}/touch_submenu/*"
>  FILES_${PN}-browser = "${MATRIX_APP_DIR}/browser_submenu/*"
> +FILES_${PN}-hmi = "${MATRIX_APP_DIR}/hmi_submenu/*"
> -- 
> 2.13.0
> 

