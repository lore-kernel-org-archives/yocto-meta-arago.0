Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 818BF52979
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 18:30:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NIQlI5007546
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 13:26:47 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NIQlBD031383
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 13:26:47 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 13:26:47 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6NIQl9n014731;
	Tue, 23 Jul 2013 13:26:47 -0500
Date: Tue, 23 Jul 2013 14:26:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20130723182646.GA32068@edge>
References: <1373040583-483-1-git-send-email-ceh@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E82D58B@DLEE08.ent.ti.com>
	<20130723171753.GR31158@edge> <51EEC070.8080402@ti.com>
MIME-Version: 1.0
In-Reply-To: <51EEC070.8080402@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-arago-test: Add memtester
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
X-List-Received-Date: Tue, 23 Jul 2013 18:30:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Carlos,

It didn't make the list, as the To: field was wrong - see the headers from 
your email below:

From: Carlos Hernandez <ceh@ti.com>
To: <arago-project.org@a0850405-off1>
CC: Carlos Hernandez <ceh@ti.com>
Subject: [meta-arago][PATCH v2] packagegroup-arago-test: Add memtester

I can take it from the attachment, if you don't want to re-sent it again...

-- 
Denys


On Tue, Jul 23, 2013 at 01:42:08PM -0400, Carlos Hernandez wrote:
> Denys,
> 
> I submitted it last week, see attachment.
> 
> Carlos
> On 07/23/2013 01:17 PM, Denys Dmytriyenko wrote:
> >Ping.
> >
> >On Sat, Jul 06, 2013 at 01:56:38PM +0000, Dmytriyenko, Denys wrote:
> >>PR bump?
> >>
> >>
> >>Denys
> >>
> >>
> >>-----Original Message-----
> >>From: Hernandez, Carlos [ceh@ti.com]
> >>Received: Friday, 05 Jul 2013, 12:09
> >>To: meta-arago@arago-project.org [meta-arago@arago-project.org]
> >>Subject: [meta-arago] [PATCH] packagegroup-arago-test: Add memtester
> >>
> >>memtester is a userspace utility for testing the memory subsystem.
> >>
> >>Signed-off-by: Carlos Hernandez <ceh@ti.com>
> >>---
> >>  .../packagegroups/packagegroup-arago-test.bb       |    1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> >>index a52b84a..230b9af 100644
> >>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> >>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> >>@@ -15,6 +15,7 @@ ARAGO_TEST = "\
> >>      rt-tests \
> >>      evtest \
> >>      bc \
> >>+    memtester \
> >>      "
> >>
> >>  ARAGO_TI_TEST = "\
> >>--
> >>1.7.9.5
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server id 14.2.342.3; Mon, 15 Jul 2013
 16:05:04 -0500
Received: from a0850405-off1 (a0850405-off1.am.dhcp.ti.com [158.218.103.10])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6FL5436019124	for
 <ceh@ti.com>; Mon, 15 Jul 2013 16:05:04 -0500
Received: from a0850405 by a0850405-off1 with local (Exim 4.76)	(envelope-from
 <a0850405@a0850405-off1>)	id 1Uypx9-0002X9-Rx; Mon, 15 Jul 2013 17:05:03
 -0400
From: Carlos Hernandez <ceh@ti.com>
To: <arago-project.org@a0850405-off1>
CC: Carlos Hernandez <ceh@ti.com>
Subject: [meta-arago][PATCH v2] packagegroup-arago-test: Add memtester
Date: Mon, 15 Jul 2013 17:05:00 -0400
Message-ID: <1373922300-9705-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.7.9.5
Content-Type: text/plain
Return-Path: a0850405@a0850405-off1
X-MS-Exchange-Organization-AuthSource: DLEE70.ent.ti.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AVStamp-Mailbox: SYMANTEC;485425344;0;info
MIME-Version: 1.0
> 
> memtester is a userspace utility for testing the memory subsystem.
> 
> Signed-off-by: Carlos Hernandez <ceh@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> index a52b84a..41f6ba9 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Extended task to get System Test specific apps"
>  LICENSE = "MIT"
> -PR = "r5"
> +PR = "r6"
>  
>  inherit packagegroup
>  
> @@ -15,6 +15,7 @@ ARAGO_TEST = "\
>      rt-tests \
>      evtest \
>      bc \
> +    memtester \
>      "
>  
>  ARAGO_TI_TEST = "\
> -- 
> 1.7.9.5
> 


