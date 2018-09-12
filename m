Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 3C06A52A66
	for <meta-arago@arago-project.org>;
	Wed, 12 Sep 2018 19:50:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8CJoHPK124041
	for <meta-arago@arago-project.org>; Wed, 12 Sep 2018 14:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536781817;
	bh=vI6MpMgcV+R5AeUNfGNb7wiQQmKVoI8xNzyrQ6h/Up0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=whc16kibaXVqrDbImKBzSKEy5KHYtsufp1+OGUIsPchjpZX3kpv2Al7E4s+Wm19Wi
	OKX4Z74f+nospj8VzQSA4zPn8IPAcWdkA9fQ6PV8zxidjSKqdZBVpjn1RA+8kaFwCs
	rpN5w3D8O7XMUk4WhhFUUGj3+t8IWtn+AAsVfguA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CJoHkR002388
	for <meta-arago@arago-project.org>; Wed, 12 Sep 2018 14:50:17 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 12 Sep 2018 14:50:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 12 Sep 2018 14:50:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CJoGI2031864;
	Wed, 12 Sep 2018 14:50:16 -0500
Date: Wed, 12 Sep 2018 15:48:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20180912194850.GC12296@beryl>
References: <1536767529-46653-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536767529-46653-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] matrix-gui-qt5-demos:remove the extra .pc directory under matrix-gui/apps for k3 devices
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
X-List-Received-Date: Wed, 12 Sep 2018 19:50:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This package is allarch - you cannot do machine overrides. BTW, your previous 
change for qtwebkit patching is also incorrect - I'll revert it.


On Wed, Sep 12, 2018 at 11:52:09AM -0400, Eric Ruei wrote:
> Note: the .pc directory is created due to the k3 patch
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
> index 2401832..6241bbf 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
>  
>  require matrix-gui-apps-git.inc
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  inherit allarch
>  
> @@ -13,6 +13,11 @@ SRC_URI_append_k3 = " \
>  
>  S = "${WORKDIR}/git/qt5_apps"
>  
> +do_install_append_k3(){
> +    rm -r ${D}${MATRIX_APP_DIR}/.pc
> +}
> +
> +
>  # Make sure qt5 submenu and app images has been installed
>  RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-qt5"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

