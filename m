Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 939E9529BA
	for <meta-arago@arago-project.org>;
	Thu, 30 Apr 2015 20:08:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3UK8JUj027650
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2015 15:08:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3UK8Int006031
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2015 15:08:18 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 30 Apr 2015 15:08:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3UK8H1E026461	for
	<meta-arago@arago-project.org>; Thu, 30 Apr 2015 15:08:17 -0500
Date: Thu, 30 Apr 2015 16:08:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150430200816.GT29290@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: RFC: turning off cortex optimizations for nightlies?
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
X-List-Received-Date: Thu, 30 Apr 2015 20:08:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

I'm considering turning off cortex optimizations for nightly CoreSDK builds. 
Currently I'm building 8 machines and besides some machine-specific packages, 
most of the packages get duplicated into cortex-a8, cortex-a9 and cortex-a15 
arch-specific directories - each is about 1.5 GB.

Disabling cortex optimization will of course drop performance slightly (few 
percent, if I remember correctly), but besides size savings, it also saves on 
time for rebuilding those packages 3 times. All of them will be designated as 
armv7a and built once.

Any concerns, comments?

-- 
Denys

