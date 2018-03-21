Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 7ECC7529BD
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 16:28:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2LGSa3Z017881
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521649716;
	bh=jUAoQ3WD3r5Yk2SyYWDdOS1EHTU3V8yZs/AUAyv07yA=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=GV9GpgvrnrltGwmjjupL6mMysY8RgvEa1ZIGN48RTlQr0QvIhpdiy3xuQuWsCJ8Si
	vfUCR3CPrE/lnBz1klFVq+Ga2QEblXKugRDuofJHBkfslDNJv/HabvxWG43cgjjopW
	boBnkDdGuAnUBUVCzVIy5LZ/aO93B3ra6SocqNuQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LGSaJk022081
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:28:36 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 11:28:36 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 11:28:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LGSabk006631
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:28:36 -0500
Date: Wed, 21 Mar 2018 12:28:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20180321162835.GE14973@edge>
References: <1521582729-47998-1-git-send-email-denys@ti.com>
	<1521593761-7567-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <1521593761-7567-1-git-send-email-denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko/master][PATCHv2 1/4] matrix-gui-machinevision-demos: make machine-specific due to machine override
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
X-List-Received-Date: Wed, 21 Mar 2018 16:28:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

That still didn't solve the issue...

On Tue, Mar 20, 2018 at 08:56:01PM -0400, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - instead of removing machine override, make package machine-specific
> 
>  .../recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb      | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
> index 4adb7bc..35cd630 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
> @@ -5,7 +5,7 @@ require recipes-core/matrix/matrix-gui-apps-git.inc
>  
>  PR = "${INC_PR}.3"
>  
> -inherit allarch
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  S = "${WORKDIR}/git/machinevision_apps"
>  
> @@ -20,8 +20,11 @@ PACKAGES = "matrix-machinevision-demo-dlp3dscanner \
>              matrix-machinevision-demo-simplepeopletracking \
>  "
>  
> -RDEPENDS_matrix-machinevision-demo-dlp3dscanner_dra7xx = " \
> +RDEPENDS_matrix-machinevision-demo-dlp3dscanner = " \
>      ${MACHINEVISION_RDEPENDS} \
> +"
> +
> +RDEPENDS_matrix-machinevision-demo-dlp3dscanner_append_dra7xx = " \
>      point-cloud-viewer \
>  "
>  
> -- 
> 2.7.4
> 

