// Common part
#include "..\interfaces\common\list_box.hpp"
#include "..\interfaces\common\menu_button.hpp"
#include "..\interfaces\common\picture.hpp"
#include "..\interfaces\common\progress_bar.hpp"
#include "..\interfaces\common\structured_text.hpp"
#include "..\interfaces\common\text.hpp"

// Vote part
#include "..\interfaces\vote\vote_ihm.hpp" // 5001

class RscTitles
{
    // Loading part
    #include "..\interfaces\loadings\bar_loading.hpp"
    #include "..\interfaces\loadings\round_loading.hpp"

    // Vote part
    #include "..\interfaces\vote\selected_map_picture.hpp"
    
    // Game part
    #include "..\interfaces\game\kill_feed.hpp"
};

