Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 84E9752990
	for <meta-arago@arago-project.org>;
	Wed, 10 Jul 2013 16:32:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6AGWFdA011404
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2013 11:32:15 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6AGWFW5030805
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2013 11:32:15 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Jul 2013 11:32:15 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6AGWF5l013637;
	Wed, 10 Jul 2013 11:32:15 -0500
Date: Wed, 10 Jul 2013 12:32:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Saran, Sajesh Kumar" <sajesh@ti.com>
Message-ID: <20130710163214.GA16407@edge>
References: <8EAE6244CE843044A42356038645C8551573366C@DFLE12.ent.ti.com>
	<8EAE6244CE843044A42356038645C85515733685@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8EAE6244CE843044A42356038645C85515733685@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Senicic,
	Djordje" <d-senicic1@ti.com>
Subject: Re: Compiling gcc for A15 in Yocto
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
X-List-Received-Date: Wed, 10 Jul 2013 16:32:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 10, 2013 at 03:52:47PM +0000, Saran, Sajesh Kumar wrote:
> I am not clear in last e-mail.
> 
> We are trying to compile gcc for ARM in an X86 Ubuntu machine.

Sajesh,

If you use recent recipes in Yocto to build gcc from sources, it doesn't use 
any git or svn repositories any more, but downloads a release tarball. I've 
done it before and there's an easy way to enable it in Arago - just set 
TOOLCHAIN_TYPE=internal

-- 
Denys


> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Saran, Sajesh Kumar
> Sent: Wednesday, July 10, 2013 11:51 AM
> To: meta-arago@arago-project.org; Senicic, Djordje
> Subject: [meta-arago] Compiling gcc for A15 in Yocto
> 
> Hi,
> 
> We are trying to compile gcc for ARM (A15).
> The cloning of SVN repo is very slow and taking very long time (~6 hours and still continuing).
> 
> Have anybody have similar experience on building gcc on ARM?
> 
> Regards,
> Sajesh
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


