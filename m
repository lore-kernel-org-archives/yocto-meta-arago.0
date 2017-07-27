Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 25D0552A83
	for <meta-arago@arago-project.org>;
	Thu, 27 Jul 2017 23:26:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RNQR41022433
	for <meta-arago@arago-project.org>; Thu, 27 Jul 2017 18:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501197987;
	bh=tjDQryKcvXdxu7YKBxARzE3M3jOzJUFVh+1mIfXAAQs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ABxc1btPKWhbpH++0ZXn2qi9SgQeW1BYy2+h834DAKhizVV2TdsXmPZOuuNqxrBjS
	YqDc/8IApbBkPHUK9G5FoFL4T1PHfuCvrKOS+gHjLu2qVIza6Potwn94MDo9vVAhEc
	v1jSf0p6Yb22djEoUXNxDWZRB+BW7R0KHtcGlVrw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RNQLt3016733
	for <meta-arago@arago-project.org>; Thu, 27 Jul 2017 18:26:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 18:26:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RNQLPT015028;
	Thu, 27 Jul 2017 18:26:21 -0500
Date: Thu, 27 Jul 2017 19:26:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170727232618.GR18367@edge>
References: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
	<1501194495-48938-3-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1501194495-48938-3-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH 2/4] matix-gui-browser-demos: add browser demos
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
X-List-Received-Date: Thu, 27 Jul 2017 23:26:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 27, 2017 at 06:28:13PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui-browser-demos_2.0.bb  | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
> new file mode 100644
> index 0000000..63811c7
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Various Demo Browsers for Matrix v2"

SUMMARY ^^^


> +HOMEPAGE = "https://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
> +
> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = "${WORKDIR}/git/browser_apps"
> +
> +# Make sure browser submenu and app images has been installed
> +RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-browser"
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> +FILES_${PN} += "${bindir}/runGoogleChrome.sh"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

