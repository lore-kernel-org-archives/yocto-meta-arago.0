Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 61FAA529FF
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 19:44:12 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MJiB6G023475
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 14:44:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MJiBOA025747
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 14:44:11 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 14:44:11 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7MJiBBG006301;
	Wed, 22 Aug 2012 14:44:11 -0500
Date: Wed, 22 Aug 2012 15:44:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20120822194410.GI21025@edge>
References: <8F29D6B095ED194EA1980491A5E029710C2A8965@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2A8965@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Choosing a location for tasks in meta-arago-distro
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
X-List-Received-Date: Wed, 22 Aug 2012 19:44:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 22, 2012 at 07:36:03PM +0000, Cooper Jr., Franklin wrote:
> Right now we have two separate location for tasks in meta-arago-distro:
> meta-arago-distro / recipes-core / tasks /
> meta-arago-distro / recipes-tisdk / tasks /
> 
> Each of these directories have several tasks inside of them. Since this is a 
> distribution specific layer I don't see a need for two separate tasks 
> directories which are Arago specific.  I  vote for using recipes-core/task 
> which seems to be the standard. We should also have the images directory 
> located in the same place that we choose to put the tasks directory. The 
> bigger issue that we have now is that we have two files with the name 
> task-arago-base-tisdk.bb in the directories mentioned above.

Ah, oops. They are almost identical though, but I sure missed the presence of 
base-tisdk task recipe in that special location... I would agree we need to 
consolidate them and would agree recipes-core/tasks and recipes-core/images is 
a better, more standard location.

-- 
Denys

