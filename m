Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 87B9C529D3
	for <meta-arago@arago-project.org>;
	Thu, 25 Jul 2013 20:31:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6PKVZrD011029
	for <meta-arago@arago-project.org>; Thu, 25 Jul 2013 15:31:35 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6PKVZWp010339
	for <meta-arago@arago-project.org>; Thu, 25 Jul 2013 15:31:35 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 25 Jul 2013 15:31:35 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6PKVZKw019657;
	Thu, 25 Jul 2013 15:31:35 -0500
Date: Thu, 25 Jul 2013 16:31:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20130725203134.GE2222@edge>
References: <4F9216F96E5DF9428610502835A9F4905493CA66@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905493CA66@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Help needed: Issues wtih applications using shared library
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
X-List-Received-Date: Thu, 25 Jul 2013 20:31:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 25, 2013 at 04:45:55PM +0000, Nelson, Sam wrote:
> Hello All,
> We are running into issues with application running shared application looking for the *.so file.
> The file system only has the *.so.1, *.so.1.0 files. ( with the major and minor versions).
> 
> netfpproxy.out -p /usr/lib/netfp_proxy/plugins/netfpproxy_plugin.so -d 10 -v
> netfpproxy.out: error while loading shared libraries: libnl-xfrm.so: cannot open shared object file: No such file o
> r directory
> 
> I am pretty new to this. Any ideas on what may be wrong here is appreciated?
> With regards,

Sam,

Looks like something was not built properly. Most probably, at the time of 
compiling/linking, there was only .so of the library available, and not 
corresponding .so.X and/or .so.X.Y and the linker ended up hardcoding the 
version-less library dependency in the app binary.

-- 
Denys

