Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id DF83552B09
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 00:33:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v130XdKW028712;
	Thu, 2 Feb 2017 18:33:39 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v130XdLc029816;
	Thu, 2 Feb 2017 18:33:39 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Feb 2017 18:33:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v130Xclo019848;
	Thu, 2 Feb 2017 18:33:38 -0600
Date: Thu, 2 Feb 2017 19:33:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20170203003337.GA19545@edge>
References: <CADySD0FEFTwomoxgH9hhP97vxkW5aH5EJqh4h1+_thpS5cPsFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0FEFTwomoxgH9hhP97vxkW5aH5EJqh4h1+_thpS5cPsFQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: How to remove linux headers from rootfs
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
X-List-Received-Date: Fri, 03 Feb 2017 00:33:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 03, 2017 at 01:26:38PM +1300, Ankur Tyagi wrote:
> Hi,
> 
> I have an image recipe which include packagegroup-core-boot which
> brings in external-linaro-toolchain which in turn adds
> linux-libc-headers.
> 
> How can I remove linux-libc-headers from my end root FS ?

linux-libc-headers is an empty package. linux-libc-headers-dev is the one that 
contains all the standard headers required for development. Which one you have?

-- 
Denys

