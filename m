Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 1553452985
	for <meta-arago@arago-project.org>;
	Thu,  6 Sep 2018 16:47:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w86GlBh4045617
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 11:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536252431;
	bh=C4uwTtrzk2UExvvCQ+YqfsUuBW1YFwb3epm0Di6NIgs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ifIduGh8sqz7n3G9U40ApDxEUlb8mlYSbItQxi0J4UkSRLz5rJhTN8HRnF6cvw0wP
	XVfm4uv8Pa+nzGQFBRj9mmQKdm2SEkHziMGpfD5EIt7op3Uz/fWgmJ/Eh6B4W44AUI
	5T826SLVxsTohylSvsKU0zOlXXj0oBG+3J87sWPg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86GlB98019370
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 11:47:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 6 Sep 2018 11:47:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 6 Sep 2018 11:47:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86GlBlb025106;
	Thu, 6 Sep 2018 11:47:11 -0500
Date: Thu, 6 Sep 2018 12:45:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Djordje Senicic <x0157990@ti.com>
Message-ID: <20180906164538.GN13472@beryl>
References: <1536153704-31603-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536153704-31603-1-git-send-email-x0157990@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, d-senicic1@ti.com
Subject: Re: [rocko/master][PATCH] packagegroup-arago-tisdk-matrix: new tidl examples added to package group
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
X-List-Received-Date: Thu, 06 Sep 2018 16:47:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Seems to break the build with:

nothing provides matrix-tidl-demo-livecam_lg2 needed by packagegroup-arago-tisdk-matrix-1.0-r73.2.am57xx_evm

-- 
Denys


On Wed, Sep 05, 2018 at 09:21:44AM -0400, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index ea282d2..907c989 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -161,6 +161,9 @@ MATRIX_APPS_append_dra7xx += " \
>      matrix-tidl-demo-staticimg \
>      matrix-tidl-demo-pnexamples \
>      matrix-tidl-demo-livecam \
> +    matrix-tidl-demo-livecam_lg2 \
> +    matrix-tidl-demo-staticimg_lg2 \
> +    matrix-tidl-demo-staticimg_dsponly \
>  "
>  
>  MATRIX_APPS_append_keystone = " \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

