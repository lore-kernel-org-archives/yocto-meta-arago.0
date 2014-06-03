Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 3C67252AB3
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 02:30:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6K00DXQMXPASE0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Jun 2014 21:30:02 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 87F392008D; Mon,
	02 Jun 2014 22:29:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 Jun 2014 22:29:36 -0400
Message-id: <1401762581-31370-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 0/5] qt5-related fixes
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
X-List-Received-Date: Tue, 03 Jun 2014 02:30:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

This patchset is a re-submit of the Qt5-related portion of the earlier series
that was discussed couple weeks ago and used in the Weston-based demo. The rest
of patches will follow shortly, after some cleanup.

