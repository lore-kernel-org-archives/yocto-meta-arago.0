Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1BEC152A19
	for <meta-arago@arago-project.org>;
	Wed, 12 Aug 2015 03:42:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7C3ggCW002287
	for <meta-arago@arago-project.org>; Tue, 11 Aug 2015 22:42:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7C3ggQL001939
	for <meta-arago@arago-project.org>; Tue, 11 Aug 2015 22:42:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 11 Aug 2015 22:42:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7C3gfhu012007;
	Tue, 11 Aug 2015 22:42:41 -0500
Date: Tue, 11 Aug 2015 23:42:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150812034226.GR30560@edge>
References: <1439301710-31159-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1439301710-31159-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 0/5] TI OpenCL
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
X-List-Received-Date: Wed, 12 Aug 2015 03:42:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks.

1. Is 3/5 missing?
2. Can you be more specific, as multiple recipes say "TI OpenCL" in 
description.


On Tue, Aug 11, 2015 at 10:01:45AM -0400, Jacob Stiffler wrote:
> This patch set provides the complte set of OpenCL packages for TI devices.
> 
> Jacob Stiffler (5):
>   clocl: Add opencl kernel compiler.
>   opencl-monitor: Add opencl monitor firmware
>   ocl-gl-headers: Add GL headers required for opencl.
>   opencl: Add the opencl library
>   opencl-examples: Add the opencl examples.
> 
>  meta-arago-extras/recipes-ti/ocl/clocl_git.bb      |    34 +
>  .../recipes-ti/ocl/ocl-gl-headers/GL/gl.h          |  2235 ++++
>  .../recipes-ti/ocl/ocl-gl-headers/GL/gl_mangle.h   |  2311 ++++
>  .../recipes-ti/ocl/ocl-gl-headers/GL/glext.h       | 10776 +++++++++++++++++++
>  .../recipes-ti/ocl/ocl-gl-headers/GL/glx.h         |   513 +
>  .../recipes-ti/ocl/ocl-gl-headers/GL/glx_mangle.h  |    82 +
>  .../recipes-ti/ocl/ocl-gl-headers/GL/glxext.h      |  1001 ++
>  .../ocl/ocl-gl-headers/GL/internal/dri_interface.h |  1189 ++
>  .../recipes-ti/ocl/ocl-gl-headers/GL/osmesa.h      |   283 +
>  .../recipes-ti/ocl/ocl-gl-headers/GL/wglext.h      |   901 ++
>  .../recipes-ti/ocl/ocl-gl-headers/GL/wmesa.h       |   140 +
>  .../recipes-ti/ocl/ocl-gl-headers_git.bb           |    25 +
>  meta-arago-extras/recipes-ti/ocl/ocl.inc           |    10 +
>  .../recipes-ti/ocl/opencl-examples_git.bb          |    77 +
>  .../recipes-ti/ocl/opencl-monitor_git.bb           |    58 +
>  meta-arago-extras/recipes-ti/ocl/opencl_git.bb     |    55 +
>  16 files changed, 19690 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/clocl_git.bb
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/gl.h
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/gl_mangle.h
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glext.h
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glx.h
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glx_mangle.h
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glxext.h
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/internal/dri_interface.h
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/osmesa.h
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/wglext.h
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/wmesa.h
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers_git.bb
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl.inc
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> 
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

