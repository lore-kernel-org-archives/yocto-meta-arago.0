Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C03E4529A7
	for <meta-arago@arago-project.org>;
	Wed,  4 Feb 2015 21:16:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t14LGVJK014007
	for <meta-arago@arago-project.org>; Wed, 4 Feb 2015 15:16:32 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t14LGUI3024298
	for <meta-arago@arago-project.org>; Wed, 4 Feb 2015 15:16:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Feb 2015 15:16:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t14LGUn0021453	for
	<meta-arago@arago-project.org>; Wed, 4 Feb 2015 15:16:30 -0600
Date: Wed, 4 Feb 2015 16:16:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150204211629.GK6257@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Qt 5.5 enhancements for Linux graphics and input stacks
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
X-List-Received-Date: Wed, 04 Feb 2015 21:16:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

The big news here is Qt 5.5 is switching to libinput that is already being 
used by Wayland/Weston - that should unify and improve touchscreen support!

http://blog.qt.io/blog/2015/01/20/qt-weekly-23-qt-5-5-enhancements-for-linux-graphics-and-input-stacks/

-- 
Denys

