Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id E9FEF52AB8
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 16:17:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TGHn82011076
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504023469;
	bh=TvxTR6oB019iqOW/5uhotJfWfi1d4gy+tSXQBe3f4uY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UQRjFuMFt3buHnLsqOwxCfeyZ3pRO3iXPeTEPr1MdlWe+JMtzIqPbukoY6hy9w32q
	qaT7OXaf/t4xiweWT01hqKp0O6wV0kL4pBl3wSFt4yErDXsh5xqcvFranTuJ9KfvE/
	sZqKxU69tHFBpnvmRbgr5b8UOePCV5YG+8YzAiC0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TGHn0u002461
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:17:49 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 11:17:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 11:17:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TGHnnO031535;
	Tue, 29 Aug 2017 11:17:49 -0500
Date: Tue, 29 Aug 2017 12:17:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170829161745.GC8304@edge>
References: <1504022753-20132-1-git-send-email-e-ruei1@ti.com>
	<1504022753-20132-2-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1504022753-20132-2-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH 2/2] matrix-gui-apps-git: bump SRCREV for changes and additions
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
X-List-Received-Date: Tue, 29 Aug 2017 16:17:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

On Tue, Aug 29, 2017 at 12:05:53PM -0400, Eric Ruei wrote:
> * replace webkit-based browsers with the webengine-based ones
> * add HMI EVSE demo

This hasn't been merged yet - see my comments yesterday.


> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index b805f5e..4d74224 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "38afccb5335216ececa874cf4cf72a67c4164fc3"
> +SRCREV = "d910584814644f853f3fe4fbe715f674f24b9bd3"
>  BRANCH = "master"
> -INC_PR = "r47"
> +INC_PR = "r48"
>  
>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

