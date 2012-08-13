Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D02C5529A1
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2012 19:56:36 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7DJuaHO003531
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 14:56:36 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7DJua8k031814
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 14:56:36 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 13 Aug 2012 14:56:35 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7DJua9D002541;	Mon, 13 Aug 2012 14:56:36 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T10tD-00082u-Ex; Mon, 13 Aug 2012 15:05:27 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Aug 2012 15:05:23 -0500
Message-ID: <1344888323-30885-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] meta-arago-upstream: Create new upstream layer
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
X-List-Received-Date: Mon, 13 Aug 2012 19:56:37 -0000
Content-Type: text/plain

* This patch creates a new layer called meta-arago-upstream. The purpose
  of this layer is store needed changes that were pulled from the applicable
  master branch but can't be pulled into the corresponding maintenance branch.
* Once meta-arago tracks a new maintenance branch, the contents of this layer
  should be cleared since all the changes pulled into this layer should be
  located in the new maintenance branch.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 meta-arago-upstream/COPYING.MIT     |   17 +++++++++++++++++
 meta-arago-upstream/README          |   26 ++++++++++++++++++++++++++
 meta-arago-upstream/conf/layer.conf |    9 +++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-upstream/COPYING.MIT
 create mode 100644 meta-arago-upstream/README
 create mode 100644 meta-arago-upstream/conf/layer.conf

diff --git a/meta-arago-upstream/COPYING.MIT b/meta-arago-upstream/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/meta-arago-upstream/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy 
+of this software and associated documentation files (the "Software"), to deal 
+in the Software without restriction, including without limitation the rights 
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
+copies of the Software, and to permit persons to whom the Software is 
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in 
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
+THE SOFTWARE.
diff --git a/meta-arago-upstream/README b/meta-arago-upstream/README
new file mode 100644
index 0000000..38416f8
--- /dev/null
+++ b/meta-arago-upstream/README
@@ -0,0 +1,26 @@
+meta-arago-upstream provides a place to store changes that were upstreamed but aren't
+currently located in the applicable maintenance branch.
+
+Once meta-arago tracks a new maintenance branch, the contents of this layer should be 
+cleared since all the changes pulled into this layer should be located in the new 
+maintenance branch.
+
+This layer works with the latest Yocto Project release (currently 1.2) and tracks
+the stable/maintenance branches (currently "denzil") of the corresponding layers:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: denzil
+revision: HEAD
+
+URI: git://git.openembedded.org/meta-openembedded
+branch: denzil
+revision: HEAD
+
+URI: git://arago-project.org/git/meta-ti
+branch: denzil
+revision: HEAD
+
+Send pull requests to meta-arago@arago-project.org
+
+Layer maintainers: Chase Maupin <chase.maupin@ti.com>
+                   Denys Dmytriyenko <denys@ti.com>
diff --git a/meta-arago-upstream/conf/layer.conf b/meta-arago-upstream/conf/layer.conf
new file mode 100644
index 0000000..87b6c8c
--- /dev/null
+++ b/meta-arago-upstream/conf/layer.conf
@@ -0,0 +1,9 @@
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "meta-arago-upstream"
+BBFILE_PATTERN_meta-arago-upstream := "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-arago-upstream = "10"
-- 
1.7.7


