Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 51E9D52BB6
	for <meta-arago@arago-project.org>;
	Mon,  5 Apr 2021 21:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D703440BEC;
	Mon,  5 Apr 2021 21:19:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3sljiqdt4_Fr; Mon,  5 Apr 2021 21:19:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A140E40BE9;
	Mon,  5 Apr 2021 21:19:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E9080174579; Mon,  5 Apr 2021 17:19:48 -0400 (EDT)
Date: Mon, 5 Apr 2021 17:19:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20210405211948.GB15937@denix.org>
References: <20210405203928.7783-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210405203928.7783-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, denys@konsulko.com,
	Krunal Bhargav <k-bhargav@ti.com>
Subject: Re: [dunfell][PATCH v2 0/3] qtwebkit: Fix no x11 build
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
X-List-Received-Date: Mon, 05 Apr 2021 21:19:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 05, 2021 at 03:39:25PM -0500, Gowtham Tammana wrote:
> qtwebkit build was failing when x11 is enabled for the platform.

I guess another typo enabled/disabled here? 

If so, I don't think it requires another revision, as this is just a cover 
letter and actual patches seem fine. Thanks.


> This was due to
> qtwebkit build not picking up the EGL_NO_X11 flag from the packageconfig. This
> was earlier fixed by enabling the flag directly in the khrplatform header file.
> Fixing up to pass the flag to build environment itself.
> 
> Also cleaned up some of the old patches.
> 
> v2:
>   - fixed typo in patch 2/3 (qtwebkit: Fix no X11 build)
> 
> Gowtham Tammana (3):
>   Revert "HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at
>     ANGLE/khrplatform.h"
>   qtwebkit: Fix no X11 build
>   qtwebkit: Cleanup old patches
> 
>  ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 30 ------------
>  ...e-to-use-GL_NoX-version-of-GraphicsS.patch | 29 ------------
>  ...re-PlatformQt.cmake-Fix-no-x11-build.patch | 46 +++++++++++++++++++
>  .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch | 33 -------------
>  .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch | 17 -------
>  .../recipes-qt/qt5/qtwebkit_%.bbappend        |  8 +---
>  6 files changed, 48 insertions(+), 115 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
> 
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

