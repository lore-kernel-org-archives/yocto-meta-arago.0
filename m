Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 76E865297E
	for <meta-arago@arago-project.org>;
	Wed, 12 Jun 2019 14:10:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CE9Y1K083584
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 09:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560348575;
	bh=B0wKyuKFiGLAxBxat53NapWfwmUkT5NsTbI0gHVtzU4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OT2ZUuB9bC/OC2L12EwXlJSPYoolGCAkyaZWqnQyN4SEoDZHdT33WOC+YwNKSOyiy
	tm4mw3E/7OlihQ/a01F9e1J/l1sRpc9ngf2eDdhaJKpw+yskSiCgwLcmmNrWLY7ENw
	KLt1w3gtNqi3N935hpa9UkS4bZFJrSGvwt3lJ1Hg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CE9YXT035890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 09:09:34 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 12 Jun 2019 09:09:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 12 Jun 2019 09:09:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CE9YOZ067952;
	Wed, 12 Jun 2019 09:09:34 -0500
Date: Wed, 12 Jun 2019 10:09:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Djordje Senicic <x0157990@ti.com>
Message-ID: <20190612140934.GA17081@beryl>
References: <20190611180913.10651-1-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190611180913.10651-1-x0157990@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master][PATH] point-cloud-viewer: New binary compiled with gcc8 toolchain
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
X-List-Received-Date: Wed, 12 Jun 2019 14:10:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Now I'm seeing this:

ERROR: point-cloud-viewer-2.1-r1 do_package_qa: QA Issue: /usr/bin/point_cloud_viewer contained in package point-cloud-viewer requires libxkbcommon.so.0, but no providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]


On Tue, Jun 11, 2019 at 02:09:13PM -0400, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> index e477448b..9ee4ff0b 100644
> --- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> +++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> @@ -11,9 +11,9 @@ BRANCH = "master"
>  
>  SRC_URI = "git://git.ti.com/processor-sdk/point-cloud-viewer.git;protocol=git;branch=${BRANCH}"
>  
> -SRCREV = "ac8f7a8334b6458676810349ab84f718ecd16975"
> +SRCREV = "c4800b186744e9379c798299c5caa67f6a4468f0"
>  
> -PV = "2.0"
> +PV = "2.1"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

