Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DEBBE529E2
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 17:46:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u14HkNnv018433
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 11:46:23 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14HkN7N032766
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 11:46:23 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Feb 2016 11:46:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14HkM3o028621;
	Thu, 4 Feb 2016 11:46:23 -0600
Date: Thu, 4 Feb 2016 12:46:07 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160204174606.GJ31480@edge>
References: <1454594668-2894-1-git-send-email-j-stiffler@ti.com>
	<20160204172753.GI31480@edge> <56B38B98.2020906@ti.com>
MIME-Version: 1.0
In-Reply-To: <56B38B98.2020906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3] packagegroup-arago-tisdk-addons: Add debug tools such as gdb
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
X-List-Received-Date: Thu, 04 Feb 2016 17:46:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 04, 2016 at 12:34:16PM -0500, Jacob Stiffler wrote:
> Can you point to where this is? I do not see any in the meta-arago
> packagegroups, and it has been missing from our filesystem.

images/tisdk-server-rootfs-image.bb
packagegroups/packagegroup-arago-test-addons.bb

Surprisingly, server-rootfs-image is the only consumer of the test-addons 
packagegroup... And adding gdb directly to a server image was a temp hack 3+ 
years ago - "nothing is more permanent than the temporary", eh? :)


> On 2/4/2016 12:27 PM, Denys Dmytriyenko wrote:
> >I think there are already couple places where gdb is added directly. Can we
> >clean those up as well?
> >
> 

