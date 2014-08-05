Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0C8BB529DD
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 18:07:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s75I7Ias003355;
	Tue, 5 Aug 2014 13:07:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75I7Hla028885;
	Tue, 5 Aug 2014 13:07:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 5 Aug 2014 13:07:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75I7F0V010210;
	Tue, 5 Aug 2014 13:07:16 -0500
Date: Tue, 5 Aug 2014 14:07:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Matt Schuckmann <Matt.Schuckmann@planar.com>
Message-ID: <20140805180713.GC23523@edge>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
MIME-Version: 1.0
In-Reply-To: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: i686 binutils failing to build for SDK 7.0 build
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
X-List-Received-Date: Tue, 05 Aug 2014 18:07:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 05, 2014 at 10:44:28AM -0700, Matt Schuckmann wrote:
> I'm trying to build a basic image using Arago, SDK 7.0 config 
> (configs/amsdk/amsdk-07.00.00.00-config.txt) and binutils 2.20.1 is failing 
> to compile for the i686 host system.
> I'm building on a Ubuntu 14.04 32bit VM. 
> 
> My bitbake command is: 
> MACHINE=am335x-evm;bitbake core-image-minimal
> 
> The errors are:
> binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:326: unknown command `colophon'
> binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:337: unknown command `cygnus'
> 
> It looks like this was a known problem for building binutils that has been 
> fixed a long time ago and since SDK 7.0 is released code I would have 
> assumed the problem was taken care for the Arago build so I'm a little 
> puzzled why I'm getting this now.

Matt,

Since you are using amsdk-07.00.00.00-config.txt config, you are building the 
same exact version that was released as AMSDK 7.0. That config is not being 
updated to pick up any latest code.

If you want to try latest code base, you better off trying arago-daisy-config.txt
That would pull in everything latest from corresponding Daisy branches, which 
is the latest stable release.

-- 
Denys

