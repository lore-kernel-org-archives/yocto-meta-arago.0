Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1AD9C52AF9
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 19:03:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v23J3QBI020688
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 13:03:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488567806;
	bh=lG4jvLHW4Unuc/oR/xCJCXD2wPhCqFkgDVCTPvjoGYg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kMpUCXZ4hRRv9f+QtWvvYBD7aR8vYVgce3VO9b+sjdV9EfF42wJUiEJ9JzYArSRhf
	8TBrGeq6I/i13xbO5x48t2lEmFzs5MnyIlEeTgnoRX6DxmRdi0IxTvU5+nI0VAHoPT
	JilA60JwDjqDnyaGGz0zOJhxIYDN5MNZHzrTJK54=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23J3LXN015888
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 13:03:21 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Mar 2017 13:03:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23J3LVT005569;
	Fri, 3 Mar 2017 13:03:21 -0600
Date: Fri, 3 Mar 2017 14:03:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20170303190320.GH12614@edge>
References: <1488551149-39460-1-git-send-email-ceh@ti.com>
	<1488551149-39460-2-git-send-email-ceh@ti.com>
MIME-Version: 1.0
In-Reply-To: <1488551149-39460-2-git-send-email-ceh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, yan-liu@ti.com
Subject: Re: [PATCH 2/2] ltp-ddt: update to latest version
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
X-List-Received-Date: Fri, 03 Mar 2017 19:03:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Should probably change the version as well - it's no longer 20160510.

On Fri, Mar 03, 2017 at 09:25:49AM -0500, Carlos Hernandez wrote:
> Signed-off-by: Carlos Hernandez <ceh@ti.com>
> ---
>  meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
> index 3bb17c8f8535..8908092e8e09 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
> @@ -14,7 +14,7 @@ RDEPENDS_${PN} += "pm-qa serialcheck"
>  
>  inherit autotools-brokensep
>  
> -SRCREV = "429d12779e28e1997f656db19c5bf73edf9e9365"
> +SRCREV = "7b43afae8b931541388b0a7e6f65d7ceb6d01b3e"
>  BRANCH ?= "master"
>  
>  SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

