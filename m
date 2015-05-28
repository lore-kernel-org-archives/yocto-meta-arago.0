Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8BF2652A21
	for <meta-arago@arago-project.org>;
	Thu, 28 May 2015 14:53:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4SErals003954
	for <meta-arago@arago-project.org>; Thu, 28 May 2015 09:53:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4SEra5g029064
	for <meta-arago@arago-project.org>; Thu, 28 May 2015 09:53:36 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 09:53:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4SEra3f026980	for
	<meta-arago@arago-project.org>; Thu, 28 May 2015 09:53:36 -0500
Date: Thu, 28 May 2015 10:53:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150528145335.GD16418@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Daisy branch
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
X-List-Received-Date: Thu, 28 May 2015 14:53:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

I've branched out current Daisy code base of meta-arago into its own branch 
and freed up master for future development against latest Fido release. Please 
go ahead and update your config files to point meta-arago layer to "daisy" 
branch. I have already updated generic arago-daisy-config and Jake has 
submitted the same for Processor SDK - please don't wait too long for other 
configs, as it might soon break on master due to changes required for Fido.

-- 
Denys

