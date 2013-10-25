Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2DEEE52A67
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 09:33:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9P9XbLK029670
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:33:37 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9Xb7s027029
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:33:37 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 25 Oct 2013 04:33:36 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9XZS9016397	for
	<meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:33:36 -0500
Date: Fri, 25 Oct 2013 15:03:35 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20131025093335.GA20172@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 0/5] GStreamer multimedia framework and plugins recipes
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
X-List-Received-Date: Fri, 25 Oct 2013 09:33:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This patch-set adds GStreamer framework and its plugins:
base, good, bad and ugly.

The development trees for all of these components are mainitained at 
git.ti.com and they are based on top of the Freedesktop releases.


Mrinmayee Hingolikar (5):
  multimedia: Add GStreamer multimedia framework.
  multimedia: GStreamer base plugins
  multimedia: GStreamer good plugins
  multimedia: GStreamer bad plugins
  multimedia: GStreamer ugly plugins.

 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   25 ++++++++++++++++++++
 .../gstreamer/gst-plugins-base_0.10.36.bbappend    |   22 +++++++++++++++++
 .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   20 ++++++++++++++++
 .../gstreamer/gst-plugins-ugly_0.10.18.bb          |   23 ++++++++++++++++++
 .../gstreamer/gstreamer_0.10.36.bbappend           |   16 +++++++++++++
 5 files changed, 106 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend

-- 
1.7.9.5


