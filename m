Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C257D52994
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 18:16:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OIGWTV019273;
	Thu, 24 Jul 2014 13:16:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIGWUD032711;
	Thu, 24 Jul 2014 13:16:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Jul 2014 13:16:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIGWCg026434;
	Thu, 24 Jul 2014 13:16:32 -0500
Date: Thu, 24 Jul 2014 14:16:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140724181631.GP15788@edge>
References: <1406217554-27757-1-git-send-email-denis@denix.org>
	<CFF6A9D0.4B17%chase.maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <CFF6A9D0.4B17%chase.maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH] arago-core-tisdk-2014.08.00: use the right opentest CLI
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
X-List-Received-Date: Thu, 24 Jul 2014 18:16:34 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 24, 2014 at 04:19:15PM +0000, Maupin, Chase wrote:
> ACK.  This would also explain why I see the error when moving client/*
> because the old version didn¹t have it.

Yes, but it shouldn't break, as it has || true


> On 7/24/14, 11:59 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
> 
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >TMC IP has changed and the old CLI uses the wrong one now.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > configs/coresdk/arago-core-tisdk-2014.08.00.txt | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> >b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> >index 000f903..3b00504 100644
> >--- a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> >+++ b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> >@@ -164,7 +164,7 @@ TEST_LOCAL_IFACE=""
> > 
> > # This variable contains the tarball name for the opentest CLI which is
> > # required to do target side testing.
> >-OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
> >+OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"
> > 
> > # This variable specifies the IP address of the TEE to be used with
> >OpenTest
> > # Defaults to 128.247.105.11 if not set
> >-- 
> >2.0.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

