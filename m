Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BD6F8529B5
	for <meta-arago@arago-project.org>;
	Mon, 12 Oct 2015 15:17:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9CFHaEG031210;
	Mon, 12 Oct 2015 10:17:36 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9CFHaYS030933;
	Mon, 12 Oct 2015 10:17:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 12 Oct 2015 10:17:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9CFHae0010112;
	Mon, 12 Oct 2015 10:17:36 -0500
Date: Mon, 12 Oct 2015 11:17:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20151012151720.GA28164@edge>
References: <1444390383-5586-1-git-send-email-j-stiffler@ti.com>
	<20151009113618.GE11709@denix.org> <5617A6FF.1090401@ti.com>
	<20151009114933.GF11709@denix.org>
MIME-Version: 1.0
In-Reply-To: <20151009114933.GF11709@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] init-ifupdown: Fix getting DNS if rootfs is network mount
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
X-List-Received-Date: Mon, 12 Oct 2015 15:17:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 09, 2015 at 07:49:33AM -0400, Denys Dmytriyenko wrote:
> On Fri, Oct 09, 2015 at 07:37:35AM -0400, Jacob Stiffler wrote:
> > 
> > 
> > On 10/9/2015 7:36 AM, Denys Dmytriyenko wrote:
> > >NAK, this is wrong.
> > 
> > What is wrong about it? Is there another way to get the DNS addresses?
> 
> You assume dhcp unconditionally w/o consulting /etc/interfaces file from 
> init-ifupdown

Moreover, when rootfs is mounted over NFS, the kernel is responsible for 
assigning the IP address early on, but it can be either dynamic or static, so 
again, defaulting to dhcp here is not entirely correct.


> > >On Fri, Oct 09, 2015 at 07:33:03AM -0400, Jacob Stiffler wrote:
> > >>* Previously, if the rootfs was a network mount, then no network
> > >>   configuration was done
> > >>* This included the DHCP request to obtain the DNS addresses
> > >>* If the rootfs is a network mount, then run "udhcpc" to get the DNS
> > >>   addresses
> > >>
> > >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > >>---
> > >>  meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init      | 5 ++++-
> > >>  .../recipes-core/init-ifupdown/init-ifupdown_%.bbappend              | 2 +-
> > >>  2 files changed, 5 insertions(+), 2 deletions(-)
> > >>
> > >>diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
> > >>index 86aff88..235652d 100644
> > >>--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
> > >>+++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
> > >>@@ -20,12 +20,15 @@ case "$1" in
> > >>          if sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |
> > >>            grep -q "^/ nfs$"; then
> > >>              echo "NOT configuring network interfaces: / is an NFS mount"
> > >>+            udhcpc
> > >>          elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |
> > >>            grep -q "^/ smbfs$"; then
> > >>              echo "NOT configuring network interfaces: / is an SMB mount"
> > >>-	elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts |
> > >>+            udhcpc
> > >>+        elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts |
> > >>            grep -qE '^(nfs|smbfs|ncp|coda)$'; then
> > >>              echo "NOT configuring network interfaces: network shares still mounted."
> > >>+            udhcpc
> > >>          else
> > >>              echo -n "Configuring network interfaces... "
> > >>              ifup -a
> > >>diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
> > >>index c0ab069..997adf2 100644
> > >>--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
> > >>+++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
> > >>@@ -1,4 +1,4 @@
> > >>  # look for files in this layer first
> > >>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > >>-PR_append = "-arago0"
> > >>+PR_append = "-arago1"
> > >>-- 
> > >>1.9.1
> > >>
> > >>_______________________________________________
> > >>meta-arago mailing list
> > >>meta-arago@arago-project.org
> > >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >>
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

