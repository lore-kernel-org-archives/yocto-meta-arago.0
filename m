Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id DE5955298A
	for <meta-arago@arago-project.org>;
	Wed, 17 Aug 2016 21:00:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7HL0EI5027060
	for <meta-arago@arago-project.org>; Wed, 17 Aug 2016 16:00:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7HL0EUs023136
	for <meta-arago@arago-project.org>; Wed, 17 Aug 2016 16:00:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 17 Aug 2016 16:00:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7HL0E1R013604;
	Wed, 17 Aug 2016 16:00:14 -0500
Date: Wed, 17 Aug 2016 17:00:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20160817210013.GU18333@edge>
References: <1471385087-22759-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1471385087-22759-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 0/3] add glfw3 version 3.2
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
X-List-Received-Date: Wed, 17 Aug 2016 21:00:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! I'll give it a try and will push if everything works fine.


On Tue, Aug 16, 2016 at 06:04:44PM -0400, Hongmei Gou wrote:
> Add glfw3 version 3.2, which requires two new dependencis:
> 1. wayland-protocols
> 2. extra-cmake-modules
> 
> Also a patch has been created for glfw3 to specify WaylandProtocols_PKGDATADIR with the correct prefix
> 
> Hongmei Gou (3):
>   wayland-protocols: add version 1.5
>   extra-cmake-modules: add version 1.5.0+gitrX
>   glfw3: add version 3.2
> 
>  .../wayland/wayland-protocols_1.5.bb               | 20 +++++++++++++++++
>  .../recipes-devtools/cmake/extra-cmake-modules.bb  | 18 +++++++++++++++
>  ...in-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch | 26 ++++++++++++++++++++++
>  ...IR-prefix-for-WaylandProtocols_PKGDATADIR.patch | 11 +++++++++
>  .../recipes-graphics/glfw3/glfw3_git.bb            | 24 ++++++++++++++++++++
>  5 files changed, 99 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-protocols_1.5.bb
>  create mode 100644 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
>  create mode 100644 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/glfw3/files/0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
> 
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

