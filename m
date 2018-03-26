Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9B73C5203A
	for <meta-arago@arago-project.org>;
	Mon, 26 Mar 2018 01:08:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2Q18nHI018595
	for <meta-arago@arago-project.org>; Sun, 25 Mar 2018 20:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522026529;
	bh=+nSYYmL/+46NPjyAP3+UXr52WAP8ECVY4TIXHPV23fs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GyIWCfcsvdxDpx3B4QBuoL7Bgo5zVeYlECaKxwBX+nr+UyZDDV/rWt6IL3GeK8XV2
	4awLXCBcX/uIRLzvzm0ZfeXwVZHbw6TAcpN/sentEEPd74aAfhvddRSSBnKv0HrROL
	BmP8gJ+WEXCuvC8C1LmAgJrZQdGd1ry3po1gWzKA=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2Q18nwV007746
	for <meta-arago@arago-project.org>; Sun, 25 Mar 2018 20:08:49 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Sun, 25 Mar 2018 20:08:49 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Sun, 25 Mar 2018 20:08:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2Q18npC013909;
	Sun, 25 Mar 2018 20:08:49 -0500
Date: Sun, 25 Mar 2018 21:08:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ramprasad N <x0038811@ti.com>
Message-ID: <20180326010848.GA20556@edge>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
	<1521691605-49259-2-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
In-Reply-To: <1521691605-49259-2-git-send-email-x0038811@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko 1/9] gstreamer1.0*-bad: Clean up gstreamer 1.8 bad patches
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
X-List-Received-Date: Mon, 26 Mar 2018 01:08:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Are the new patches so much different that it doesn't make sense to just 
update them?


On Thu, Mar 22, 2018 at 09:36:37AM +0530, Ramprasad N wrote:
> Remove all gstreamer bad patches. New rebased patches will
> be created instead of overwriting on the existing patches
> 
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>  ...-mouse-movement-for-videos-on-waylandsink.patch |  404 -----
>  ...gstdrmallocator-Add-DRM-allocator-support.patch |  482 ------
>  ...ylandsink-Add-mouse-drag-and-drop-support.patch |  408 -----
>  ...waylandsink-add-input-format-I420-support.patch |   89 -
>  .../0002-kmssink-remove-DCE-dependencies.patch     |   96 --
>  ...ck-previos-bug-fixes-on-different-parsers.patch |  146 --
>  ...gstkmssink-Add-support-for-KMS-based-sink.patch | 1592 ------------------
>  .../0003-kmssink-add-YUYV-support.patch            |   81 -
>  ...aylandsink-Add-DRM-support-on-waylandsink.patch | 1728 --------------------
>  ...ink-Implement-callbacks-for-version-5-of-.patch |   65 -
>  ...aylandsink-Fix-scale-up-with-padded-video.patch |   39 -
>  11 files changed, 5130 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-add-input-format-I420-support.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-remove-DCE-dependencies.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-Pick-previos-bug-fixes-on-different-parsers.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-gstkmssink-Add-support-for-KMS-based-sink.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-add-YUYV-support.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-gstwaylandsink-Add-DRM-support-on-waylandsink.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch
> 

