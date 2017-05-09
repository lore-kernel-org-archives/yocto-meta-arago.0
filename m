Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 1F9D25297F
	for <meta-arago@arago-project.org>;
	Tue,  9 May 2017 20:02:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v49K25GP009770
	for <meta-arago@arago-project.org>; Tue, 9 May 2017 15:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494360125;
	bh=v2zAQqsi0bve/ynUnd4oCjoyYINLBfBEulb+a52yAKA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SJabH7AeNGehEklePyNNZw5qptwKh8CyB879UHBMCjRUaCLf1HxlvCUdHIQBB1Eyj
	J9mQ1qlFX8xreqPsu9ORZHfcuDCKHj6XeA3yH/8C+qHH27CxrqQWuwZCQqsxXmrdVR
	jOmugo10DA1t9CoGJdi+UuhuvJxom+h38DnjaKIA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v49K2522028807
	for <meta-arago@arago-project.org>; Tue, 9 May 2017 15:02:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 9 May 2017 15:02:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v49K25g1019417;
	Tue, 9 May 2017 15:02:05 -0500
Date: Tue, 9 May 2017 16:02:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jason Reeder <jreeder@ti.com>
Message-ID: <20170509200204.GD20769@edge>
References: <1494353215-51061-1-git-send-email-denis@denix.org>
	<59121D31.4050807@ti.com>
MIME-Version: 1.0
In-Reply-To: <59121D31.4050807@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master][PATCH 1/6] systemd: remove first upstreamed network patch, now in 232
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
X-List-Received-Date: Tue, 09 May 2017 20:02:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jason,

Ah, you are right - it just failed to apply cleanly and I assumed it was 
already merged in.

We either need to update the patch against 232, or since this is master, there 
are high chances for systemd to be updated in OE-Core before the next release 
later in the fall, which would have this patch integrated in upstream. 

Preferences?

-- 
Denys


On Tue, May 09, 2017 at 02:49:05PM -0500, Jason Reeder wrote:
> Denys, this first patch didn't make it into systemd until v233. The next two
> patches have been merged upstream but won't be in a tagged release until the 
> upcoming v234.
> 
> Jason
> 
> On 05/09/2017 01:06 PM, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  ...emd-network-ipv4ll-probe-conflict-counter.patch | 48 ----------------------
> >  .../recipes-core/systemd/systemd_%.bbappend        |  1 -
> >  2 files changed, 49 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
> > 
> > diff --git a/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch b/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
> > deleted file mode 100644
> > index 557a297..0000000
> > --- a/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
> > +++ /dev/null
> > @@ -1,48 +0,0 @@
> > -From 1e47842a0144c501cc6fd7ccc7996761f3e32ea9 Mon Sep 17 00:00:00 2001
> > -From: Jason Reeder <jasonreeder@gmail.com>
> > -Date: Mon, 3 Apr 2017 12:07:17 -0500
> > -Subject: [PATCH 1/3] libsystemd-network: ipv4ll probe conflict counter
> > -
> > -A bug exists where the conflict counter is cleared
> > -regardless of whether or not the next probe attempt leads to
> > -a successful address acquisition. This causes 'bursts' of
> > -MAX_CONFLICTS probes followed by a delay of
> > -RATE_LIMIT_INTERVAL instead of a single probe each
> > -RATE_LIMIT_INTERVAL when beyond MAX_CONFLICTS.
> > -
> > -The conflict counter should only be cleared after an
> > -address is successfully acquired. This commit achieves that
> > -goal.
> > -
> > -From RFC3927:
> > -A host should maintain a counter of the number of address
> > -conflicts it has experienced in the process of trying to
> > -acquire an address, and if the number of conflicts exceeds
> > -MAX_CONFLICTS then the host MUST limit the rate at which it
> > -probes for new addresses to no more than one new address per
> > -RATE_LIMIT_INTERVAL.  This is to prevent catastrophic ARP
> > -storms in pathological failure cases, such as a rogue host
> > -that answers all ARP probes, causing legitimate hosts to go
> > -into an infinite loop attempting to select a usable address.
> > -
> > -Signed-off-by: Jason Reeder <jasonreeder@gmail.com>
> > ----
> > - src/libsystemd-network/sd-ipv4acd.c | 2 --
> > - 1 file changed, 2 deletions(-)
> > -
> > -diff --git a/src/libsystemd-network/sd-ipv4acd.c b/src/libsystemd-network/sd-ipv4acd.c
> > -index cc7436d..97f37f2 100644
> > ---- a/src/libsystemd-network/sd-ipv4acd.c
> > -+++ b/src/libsystemd-network/sd-ipv4acd.c
> > -@@ -249,8 +249,6 @@ static int ipv4acd_on_timeout(sd_event_source *s, uint64_t usec, void *userdata)
> > -                         r = ipv4acd_set_next_wakeup(ll, RATE_LIMIT_INTERVAL, PROBE_WAIT);
> > -                         if (r < 0)
> > -                                 goto out;
> > --
> > --                        ll->conflict = 0;
> > -                 } else {
> > -                         r = ipv4acd_set_next_wakeup(ll, 0, PROBE_WAIT);
> > -                         if (r < 0)
> > --- 
> > -1.9.1
> > -
> > diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> > index 8fccdb5..5f54316 100644
> > --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> > +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> > @@ -14,7 +14,6 @@ SRC_URI_append = " \
> >      file://30-wlan.network \
> >      file://60-usb.network \
> >      file://sync-clocks.service \
> > -    file://0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch \
> >      file://0002-libsystemd-network-sd-ipv4ll-Wrapper-to-restart-addr.patch \
> >      file://0003-libsystemd-network-sd-ipv4ll-acquire-new-address-aft.patch \
> >  "
> > 
> 
> -- 
> Jason Reeder
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

