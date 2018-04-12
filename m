Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 818A7529B2
	for <meta-arago@arago-project.org>;
	Thu, 12 Apr 2018 16:00:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3CG04kP006099
	for <meta-arago@arago-project.org>; Thu, 12 Apr 2018 11:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523548804;
	bh=ogbpLif2DLL9QjjtR/kKgApz+ZILo7sSsdSRt+D6WCY=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=LASpJCKrw7N/AuWqFRJgQl20V+pzq6ddaOARGfUeeqxCKPC0QBFUqicGHz0nao5AG
	Ch1c6JeLo5gBMhB0bmPIDaWZSwruPabBu8TQxDg4/lX2DFCi58yFRlB5jBswnuY6md
	dAEldWrP44utN0EwWN+PI4d1woY74nhwDYmUufgk=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3CG02uE017530
	for <meta-arago@arago-project.org>; Thu, 12 Apr 2018 11:00:03 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 12 Apr 2018 11:00:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 12 Apr 2018 11:00:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3CG02Ql011158
	for <meta-arago@arago-project.org>; Thu, 12 Apr 2018 11:00:02 -0500
Date: Thu, 12 Apr 2018 12:00:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20180412160001.GH4939@edge>
References: <1523545087-21125-1-git-send-email-denys@ti.com>
	<1523545087-21125-2-git-send-email-denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <1523545087-21125-2-git-send-email-denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko/master][PATCH 2/2] gstreamer1.0-plugins: make bbappends more generic for any minor version of 1.12.x
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
X-List-Received-Date: Thu, 12 Apr 2018 16:00:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 12, 2018 at 10:58:07AM -0400, Denys Dmytriyenko wrote:
> Should be applicable to any minor version in 1.12.x as those are bugfixes.
> Works on 1.12.2 in rocko and 1.12.4 in master.

Actually, it's not as clean as I first thought - some patches for some 
platforms don't apply on 1.12.4...


> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...lugins-bad_1.12.2.bbappend => gstreamer1.0-plugins-bad_1.12%.bbappend} | 0
>  ...gins-good_1.12.2.bbappend => gstreamer1.0-plugins-good_1.12%.bbappend} | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.12.2.bbappend => gstreamer1.0-plugins-bad_1.12%.bbappend} (100%)
>  rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.2.bbappend => gstreamer1.0-plugins-good_1.12%.bbappend} (100%)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12%.bbappend
> similarity index 100%
> rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
> rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12%.bbappend
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12%.bbappend
> similarity index 100%
> rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bbappend
> rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12%.bbappend
> -- 
> 2.7.4
> 

