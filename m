Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B51F352A7A
	for <meta-arago@arago-project.org>;
	Fri, 18 Mar 2016 20:12:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2IKCGrV020611
	for <meta-arago@arago-project.org>; Fri, 18 Mar 2016 15:12:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2IKCGi3018318
	for <meta-arago@arago-project.org>; Fri, 18 Mar 2016 15:12:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 18 Mar 2016 15:12:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2IKCFD2020147	for
	<meta-arago@arago-project.org>; Fri, 18 Mar 2016 15:12:15 -0500
Date: Fri, 18 Mar 2016 16:12:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20160318201159.GJ29659@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Branching off fido and freeing up master
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
X-List-Received-Date: Fri, 18 Mar 2016 20:12:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

Heads up, I'll be branching off current meta-arago into fido branch and 
freeing up master for the work against latest OpenEmbedded/Yocto Project 
master. Please update your configs accordingly, if you are pointing to 
meta-arago/master. Thanks.

-- 
Denys

