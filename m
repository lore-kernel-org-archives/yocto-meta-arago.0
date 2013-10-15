Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C73885299D
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 03:26:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9F3QuFg025357
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 22:26:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9F3QuOr008169
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 22:26:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 14 Oct 2013 22:26:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9F3QtG6003584	for
	<meta-arago@arago-project.org>; Mon, 14 Oct 2013 22:26:56 -0500
Date: Mon, 14 Oct 2013 23:26:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20131015032654.GB25798@edge>
References: <1381807317-3759-1-git-send-email-denis@denix.org>
	<1381807317-3759-3-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1381807317-3759-3-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 3/5] qtbase: update bbappend to disable eglfs/gles for now
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
X-List-Received-Date: Tue, 15 Oct 2013 03:26:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 14, 2013 at 11:21:55PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Until Graphics SDK gets updated to work with 3.12 kernel.
> 
> Note: this effectively disables QtWebKit-based apps like matrix-browser, as
> that depends on QtDeclarative and hence QtQuick, which requires GLES.

BTW, I'll be adding conditional setting of this Qt5 PACKAGECONFIG in the 
global distro config based on "sgx" machine flag...


> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
> index eaf1433..d35a948 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
> @@ -1,6 +1,6 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PACKAGECONFIG_GL = "gles2 icu linuxfb"
> +PACKAGECONFIG_GL = "icu linuxfb"
>  
>  SRC_URI += " \
>  	file://0001-qeglfswindow.cpp.patch \
> -- 
> 1.8.3.2
> 

