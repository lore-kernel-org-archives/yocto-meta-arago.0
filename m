Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1C23152990
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2013 15:49:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RFnup2001807
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 10:49:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RFnusr022649
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 10:49:56 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 10:49:55 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5RFntlM014321	for
	<meta-arago@arago-project.org>; Thu, 27 Jun 2013 10:49:55 -0500
Date: Thu, 27 Jun 2013 11:49:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130627154955.GA30195@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Danny branched off, work on Dylan begins
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
X-List-Received-Date: Thu, 27 Jun 2013 15:49:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

Just a heads up - I've branched off the current master into a "danny" branch 
and will be starting work on migrating meta-arago to Dylan stable release.

If you have a product that is still based on Danny, please update your layer 
configs accordingly to point meta-arago to "danny" branch. From now on, 
changes to meta-arago/master are not guaranteed to work on Danny, but no 
intentional breakages are expected though. If you need a bugfix against 
"danny", please clearly specify it in the subject of your patch.

Please let me know of any questions. Thanks.

-- 
Denys

