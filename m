Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A26D05296F
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 15:50:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u43FoPtT019408
	for <meta-arago@arago-project.org>; Tue, 3 May 2016 10:50:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u43FoPVA020539
	for <meta-arago@arago-project.org>; Tue, 3 May 2016 10:50:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 May 2016 10:50:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u43FoK6Y025057;
	Tue, 3 May 2016 10:50:23 -0500
Date: Tue, 3 May 2016 11:50:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160503155003.GT1546@edge>
References: <4B26FB5A64EBA14C87266869E037F9581426AF5A@DFLE09.ent.ti.com>
	<572898B7.4050309@ti.com>
MIME-Version: 1.0
In-Reply-To: <572898B7.4050309@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: k2 build failures
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
X-List-Received-Date: Tue, 03 May 2016 15:50:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 03, 2016 at 08:25:27AM -0400, Jacob Stiffler wrote:
> 
> 
> On 5/2/2016 2:59 PM, Stiffler, Jacob wrote:
> >
> >With migrating to krogoth, the k2 build failures are due to
> >conflicts between the ocl-gl-headers and mesa, and I’ve discovered
> >why mesa is being pulled in.
> >
> >In the opencv recipe, we are inheriting “cmake_qt5”. This bbclass
> >was changed to add the dependency on qtbase, and this brings in
> >mesa for keystone.
> >
> >I’m not sure of the best way to handle this. The easiest hack is
> >the remove qtbase from the opencv dependencies for keystone only.
> >
> >Would it be possible to replace opencl’s dependency on
> >“ocl-gl-headers” with “mesa-gl”? In the past, I made some attempts
> >to use “mesa”, but with the SGX platforms, there was always a
> >conflict with the ti sgx drivers, as both were installing common
> >gles files. I do not remember mesa-gl being an option before.
> >
> 
> I treid replacing opencl's dependency on ocl-gl-headers with
> virtual/libgl. This appears to work for keystone, but for
> am57xx-evm, there is a conflict between mesa-gl and libgbm recipes
> as mesa-gl also provides a libgbm package. How can this conflict be
> resolved?

Lately I've been pushing for changes in that area in upstream, so there's some 
understanding and agreement, but there are several levels of change required 
and some details are still being worked on... Hopefully I can convince the 
upstream graphics guy to push the initial mesa-gl/libgbm decoupling patches 
in, which I already tested, but he's on vacation now after the release last 
week. So, it will take some time to do it properly, even though it's been 
progressing slowly for a while. Meanwhile we can make it work by patching 
cmake class, if needed...

-- 
Denys

