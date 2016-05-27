Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C1D4652983
	for <meta-arago@arago-project.org>;
	Fri, 27 May 2016 14:10:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4REAJg4004711
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 09:10:19 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4REAK1f006746
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 09:10:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 27 May 2016 09:10:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4REAK0I007199;
	Fri, 27 May 2016 09:10:20 -0500
Date: Fri, 27 May 2016 10:10:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20160527141004.GD14462@edge>
References: <1464262490-15361-1-git-send-email-a0393906@ti.com>
	<20160527020613.GC14462@edge> <574800CA.6000809@ti.com>
MIME-Version: 1.0
In-Reply-To: <574800CA.6000809@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] weston-conf: set default backend to drm-backend
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
X-List-Received-Date: Fri, 27 May 2016 14:10:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 27, 2016 at 01:39:46PM +0530, Karthik Ramanan wrote:
> 
> 
> On 27-May-16 7:36 AM, Denys Dmytriyenko wrote:
> >On Thu, May 26, 2016 at 05:04:50PM +0530, Karthik Ramanan wrote:
> >>Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> >>---
> >>  meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >>diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
> >>index 615a604..4178ed3 100644
> >>--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
> >>+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
> >>@@ -1,3 +1,6 @@
> >>+[core]
> >>+backend=drm-backend.so
> >Isn't that the default?
> 
> The default backend is wayland-backend.so, since we have the WAYLAND_DISPLAY 
> defined to wayland-0, the default backend will be wayland.

But we don't build or package wayland backend...


> Source reference: https://cgit.freedesktop.org/wayland/weston/tree/src/main.c?h=1.9#n537
> 
> >
> >
> >>  [shell]
> >>  locking=false
> >>  animation=zoom
> >>-- 
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

